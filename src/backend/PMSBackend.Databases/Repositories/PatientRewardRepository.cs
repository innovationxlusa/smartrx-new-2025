using Microsoft.EntityFrameworkCore;
using PMSBackend.Databases.Data;
using PMSBackend.Domain.CommonDTO;
using PMSBackend.Domain.Entities;
using PMSBackend.Domain.Repositories;
using PMSBackend.Domain.SharedContract;

namespace PMSBackend.Databases.Repositories
{
    public class PatientRewardRepository : IPatientRewardRepository
    {
        private readonly PMSDbContext _dbContext;

        public PatientRewardRepository(PMSDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<SmartRx_PatientReward> CreatePatientRewardAsync(SmartRx_PatientReward patientReward, CancellationToken cancellationToken)
        {
            try
            {
                patientReward.CreatedDate = DateTime.UtcNow;

                // Calculate totals
                patientReward.TotalNonCashablePoints = patientReward.EarnedNonCashablePoints - patientReward.ConsumedNonCashablePoints;
                patientReward.TotalCashablePoints = patientReward.EarnedCashablePoints - patientReward.ConsumedCashablePoints;
                patientReward.TotalMoney = (patientReward.EarnedMoney ?? 0) - (patientReward.ConsumedMoney ?? 0);

                await _dbContext.SmartRx_PatientReward.AddAsync(patientReward, cancellationToken);
                await _dbContext.SaveChangesAsync(cancellationToken);

                // Reload with navigation properties
                return await GetPatientRewardByIdAsync(patientReward.Id, cancellationToken) ?? patientReward;
            }
            catch (Exception ex)
            {
                throw new Exception($"Failed to create patient reward: {ex.Message}", ex);
            }
        }

        public async Task<SmartRx_PatientReward> UpdatePatientRewardAsync(SmartRx_PatientReward patientReward, CancellationToken cancellationToken)
        {
            try
            {
                var existingReward = await _dbContext.SmartRx_PatientReward
                    .FirstOrDefaultAsync(pr => pr.Id == patientReward.Id, cancellationToken);

                if (existingReward == null)
                {
                    throw new Exception($"Patient reward with ID {patientReward.Id} not found");
                }

                // Update fields
                existingReward.BadgeId = patientReward.BadgeId;
                existingReward.EarnedNonCashablePoints = patientReward.EarnedNonCashablePoints;
                existingReward.ConsumedNonCashablePoints = patientReward.ConsumedNonCashablePoints;
                existingReward.EarnedCashablePoints = patientReward.EarnedCashablePoints;
                existingReward.ConsumedCashablePoints = patientReward.ConsumedCashablePoints;
                existingReward.EarnedMoney = patientReward.EarnedMoney;
                existingReward.ConsumedMoney = patientReward.ConsumedMoney;
                existingReward.EncashMoney = patientReward.EncashMoney;
                existingReward.Remarks = patientReward.Remarks;
                existingReward.ModifiedById = patientReward.ModifiedById;
                existingReward.ModifiedDate = DateTime.UtcNow;

                // Recalculate totals
                existingReward.TotalNonCashablePoints = existingReward.EarnedNonCashablePoints - existingReward.ConsumedNonCashablePoints;
                existingReward.TotalCashablePoints = existingReward.EarnedCashablePoints - existingReward.ConsumedCashablePoints;
                existingReward.TotalMoney = (existingReward.EarnedMoney ?? 0) - (existingReward.ConsumedMoney ?? 0);

                _dbContext.SmartRx_PatientReward.Update(existingReward);
                await _dbContext.SaveChangesAsync(cancellationToken);

                // Reload with navigation properties
                return await GetPatientRewardByIdAsync(existingReward.Id, cancellationToken) ?? existingReward;
            }
            catch (Exception ex)
            {
                throw new Exception($"Failed to update patient reward: {ex.Message}", ex);
            }
        }

        public async Task<bool> DeletePatientRewardAsync(long id, CancellationToken cancellationToken)
        {
            try
            {
                var reward = await _dbContext.SmartRx_PatientReward
                    .FirstOrDefaultAsync(pr => pr.Id == id, cancellationToken);

                if (reward == null)
                {
                    return false;
                }

                _dbContext.SmartRx_PatientReward.Remove(reward);
                await _dbContext.SaveChangesAsync(cancellationToken);

                return true;
            }
            catch (Exception ex)
            {
                throw new Exception($"Failed to delete patient reward: {ex.Message}", ex);
            }
        }

        public async Task<PaginatedResult<SmartRx_PatientReward>> GetPatientRewardsByUserIdAndPatientIdAsync(
            long userId,
            long? patientId,
            PagingSortingParams pagingSorting,
            CancellationToken cancellationToken)
        {
            try
            {
                if (pagingSorting.PageNumber <= 0) pagingSorting.PageNumber = 1;
                if (pagingSorting.PageSize <= 0) pagingSorting.PageSize = 10;

                var query = _dbContext.SmartRx_PatientReward
                    .Where(pr => pr.CreatedById == userId && (patientId == null || pr.PatientId == patientId))
                    //.Include(pr => pr.RewardBadge)
                    //.Include(pr => pr.PatientProfile)
                    //.Include(pr => pr.SmartRxMaster)
                    //.Include(pr => pr.Prescription)
                    .AsQueryable();

                // Apply sorting
                IQueryable<SmartRx_PatientReward> sortedQuery = pagingSorting.SortBy?.ToLower() switch
                {
                    "createddate" => pagingSorting.SortDirection?.ToLower() == "desc"
                        ? query.OrderByDescending(pr => pr.CreatedDate)
                        : query.OrderBy(pr => pr.CreatedDate),
                    "totalnoncashablepoints" => pagingSorting.SortDirection?.ToLower() == "desc"
                        ? query.OrderByDescending(pr => pr.TotalNonCashablePoints)
                        : query.OrderBy(pr => pr.TotalNonCashablePoints),
                    "totalcashablepoints" => pagingSorting.SortDirection?.ToLower() == "desc"
                        ? query.OrderByDescending(pr => pr.TotalCashablePoints)
                        : query.OrderBy(pr => pr.TotalCashablePoints),
                    "totalmoney" => pagingSorting.SortDirection?.ToLower() == "desc"
                        ? query.OrderByDescending(pr => pr.TotalMoney)
                        : query.OrderBy(pr => pr.TotalMoney),
                    _ => query.OrderByDescending(pr => pr.CreatedDate)
                };

                var totalRecords = await sortedQuery.CountAsync(cancellationToken);

                var pagedData = await sortedQuery
                    .Skip((pagingSorting.PageNumber - 1) * pagingSorting.PageSize)
                    .Take(pagingSorting.PageSize)
                    .ToListAsync(cancellationToken);

                return new PaginatedResult<SmartRx_PatientReward>(
                    pagedData,
                    totalRecords,
                    pagingSorting.PageNumber,
                    pagingSorting.PageSize,
                    pagingSorting.SortBy,
                    pagingSorting.SortDirection,
                    null);
            }
            catch (Exception ex)
            {
                throw new Exception($"Failed to get patient rewards: {ex.Message}", ex);
            }
        }

        public async Task<SmartRx_PatientReward?> GetPatientRewardByIdAsync(long id, CancellationToken cancellationToken)
        {
            try
            {
                return await _dbContext.SmartRx_PatientReward
                    //.Include(pr => pr.RewardBadge)
                    //.Include(pr => pr.PatientProfile)
                    //.Include(pr => pr.SmartRxMaster)
                    //.Include(pr => pr.Prescription)
                    .FirstOrDefaultAsync(pr => pr.Id == id, cancellationToken);
            }
            catch (Exception ex)
            {
                throw new Exception($"Failed to get patient reward by ID: {ex.Message}", ex);
            }
        }

        public async Task<PatientRewardSummaryContract?> GetPatientRewardsSummaryAsync(long userId, long? patientId, CancellationToken cancellationToken)
        {
            try
            {
                var rewards = await _dbContext.SmartRx_PatientReward
                    .Where(pr => pr.CreatedById == userId && (patientId == null || pr.PatientId == patientId))
                    .ToListAsync(cancellationToken);

                if (!rewards.Any())
                {
                    return null;
                }

                return new PatientRewardSummaryContract
                {
                    UserId = userId,
                    PatientId = patientId ?? 0,
                    TotalEarnedNonCashablePoints = rewards.Sum(r => r.EarnedNonCashablePoints),
                    TotalConsumedNonCashablePoints = rewards.Sum(r => r.ConsumedNonCashablePoints),
                    TotalNonCashablePoints = rewards.Sum(r => r.TotalNonCashablePoints),
                    TotalEarnedCashablePoints = rewards.Sum(r => r.EarnedCashablePoints),
                    TotalConsumedCashablePoints = rewards.Sum(r => r.ConsumedCashablePoints),
                    TotalCashablePoints = rewards.Sum(r => r.TotalCashablePoints),
                    TotalEarnedMoney = rewards.Sum(r => r.EarnedMoney ?? 0),
                    TotalConsumedMoney = rewards.Sum(r => r.ConsumedMoney ?? 0),
                    TotalMoney = rewards.Sum(r => r.TotalMoney ?? 0),
                    TotalEncashMoney = rewards.Sum(r => r.EncashMoney ?? 0)
                };
            }
            catch (Exception ex)
            {
                throw new Exception($"Failed to get patient rewards summary: {ex.Message}", ex);
            }
        }

        public async Task<PaginatedResult<SmartRx_PatientReward>> GetPatientRewardsByUserIdAsync(
            long userId,
            PagingSortingParams pagingSorting,
            CancellationToken cancellationToken)
        {
            try
            {
                if (pagingSorting.PageNumber <= 0) pagingSorting.PageNumber = 1;
                if (pagingSorting.PageSize <= 0) pagingSorting.PageSize = 10;

                var query = _dbContext.SmartRx_PatientReward
                    .Where(pr => pr.CreatedById == userId)
                    //.Include(pr => pr.RewardBadge)
                    //.Include(pr => pr.PatientProfile)
                    //.Include(pr => pr.SmartRxMaster)
                    //.Include(pr => pr.Prescription)
                    .AsQueryable();

                // Apply sorting
                IQueryable<SmartRx_PatientReward> sortedQuery = pagingSorting.SortBy?.ToLower() switch
                {
                    "createddate" => pagingSorting.SortDirection?.ToLower() == "desc"
                        ? query.OrderByDescending(pr => pr.CreatedDate)
                        : query.OrderBy(pr => pr.CreatedDate),
                    "patientid" => pagingSorting.SortDirection?.ToLower() == "desc"
                        ? query.OrderByDescending(pr => pr.PatientId)
                        : query.OrderBy(pr => pr.PatientId),
                    "totalnoncashablepoints" => pagingSorting.SortDirection?.ToLower() == "desc"
                        ? query.OrderByDescending(pr => pr.TotalNonCashablePoints)
                        : query.OrderBy(pr => pr.TotalNonCashablePoints),
                    "totalcashablepoints" => pagingSorting.SortDirection?.ToLower() == "desc"
                        ? query.OrderByDescending(pr => pr.TotalCashablePoints)
                        : query.OrderBy(pr => pr.TotalCashablePoints),
                    "totalmoney" => pagingSorting.SortDirection?.ToLower() == "desc"
                        ? query.OrderByDescending(pr => pr.TotalMoney)
                        : query.OrderBy(pr => pr.TotalMoney),
                    _ => query.OrderByDescending(pr => pr.CreatedDate)
                };

                var totalRecords = await sortedQuery.CountAsync(cancellationToken);

                var pagedData = await sortedQuery
                    .Skip((pagingSorting.PageNumber - 1) * pagingSorting.PageSize)
                    .Take(pagingSorting.PageSize)
                    .ToListAsync(cancellationToken);

                return new PaginatedResult<SmartRx_PatientReward>(
                    pagedData,
                    totalRecords,
                    pagingSorting.PageNumber,
                    pagingSorting.PageSize,
                    pagingSorting.SortBy,
                    pagingSorting.SortDirection,
                    null);
            }
            catch (Exception ex)
            {
                throw new Exception($"Failed to get patient rewards by user ID: {ex.Message}", ex);
            }
        }
    }
}

