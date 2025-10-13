using Microsoft.EntityFrameworkCore;
using PMSBackend.Databases.Data;
using PMSBackend.Domain.CommonDTO;
using PMSBackend.Domain.Entities;
using PMSBackend.Domain.Repositories;
using PMSBackend.Domain.SharedContract;
using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace PMSBackend.Databases.Repositories
{
    public class RewardRepository : IRewardRepository
    {
        private readonly PMSDbContext _dbContext;

        public RewardRepository(PMSDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<Configuration_Reward> CreateRewardAsync(Configuration_Reward reward, CancellationToken cancellationToken)
        {
            try
            {
                reward.CreatedDate = DateTime.UtcNow;
                reward.IsActive = true;

                await _dbContext.Configuration_Reward.AddAsync(reward, cancellationToken);
                await _dbContext.SaveChangesAsync(cancellationToken);

                return reward;
            }
            catch (Exception ex)
            {
                throw new Exception($"Failed to create reward: {ex.Message}", ex);
            }
        }

        public async Task<Configuration_Reward> UpdateRewardAsync(Configuration_Reward reward, CancellationToken cancellationToken)
        {
            try
            {
                var existingReward = await _dbContext.Configuration_Reward
                    .FirstOrDefaultAsync(r => r.Id == reward.Id, cancellationToken);

                if (existingReward == null)
                {
                    throw new Exception($"Reward with ID {reward.Id} not found");
                }

                // Update fields
                existingReward.Heading = reward.Heading;
                existingReward.Details = reward.Details;
                existingReward.IsNegativePointAllowed = reward.IsNegativePointAllowed;
                existingReward.NonCashablePoints = reward.NonCashablePoints;
                existingReward.IsCashable = reward.IsCashable;
                existingReward.CashablePoints = reward.CashablePoints;
                existingReward.IsActive = reward.IsActive;
                existingReward.ModifiedById = reward.ModifiedById;
                existingReward.ModifiedDate = DateTime.UtcNow;

                _dbContext.Configuration_Reward.Update(existingReward);
                await _dbContext.SaveChangesAsync(cancellationToken);

                return existingReward;
            }
            catch (Exception ex)
            {
                throw new Exception($"Failed to update reward: {ex.Message}", ex);
            }
        }

        public async Task<bool> DeleteRewardAsync(long id, CancellationToken cancellationToken)
        {
            try
            {
                var reward = await _dbContext.Configuration_Reward
                    .FirstOrDefaultAsync(r => r.Id == id, cancellationToken);

                if (reward == null)
                {
                    return false;
                }

                _dbContext.Configuration_Reward.Remove(reward);
                await _dbContext.SaveChangesAsync(cancellationToken);

                return true;
            }
            catch (Exception ex)
            {
                throw new Exception($"Failed to delete reward: {ex.Message}", ex);
            }
        }

        public async Task<Configuration_Reward?> GetRewardByIdAsync(long id, CancellationToken cancellationToken)
        {
            try
            {
                return await _dbContext.Configuration_Reward
                    .FirstOrDefaultAsync(r => r.Id == id, cancellationToken);
            }
            catch (Exception ex)
            {
                throw new Exception($"Failed to get reward by ID: {ex.Message}", ex);
            }
        }

        public async Task<PaginatedResult<Configuration_Reward>> GetAllRewardsAsync(
            PagingSortingParams pagingSorting,
            CancellationToken cancellationToken)
        {
            try
            {
                if (pagingSorting.PageNumber <= 0) pagingSorting.PageNumber = 1;
                if (pagingSorting.PageSize <= 0) pagingSorting.PageSize = 10;

                var query = _dbContext.Configuration_Reward
                   // .Where(r => r.IsActive == true)
                    .AsQueryable();

                // Apply sorting
                IQueryable<Configuration_Reward> sortedQuery = pagingSorting.SortBy?.ToLower() switch
                {
                    "heading" => pagingSorting.SortDirection?.ToLower() == "desc"
                        ? query.OrderByDescending(r => r.Heading)
                        : query.OrderBy(r => r.Heading),
                    "noncashablepoints" => pagingSorting.SortDirection?.ToLower() == "desc"
                        ? query.OrderByDescending(r => r.NonCashablePoints)
                        : query.OrderBy(r => r.NonCashablePoints),
                    "cashablepoints" => pagingSorting.SortDirection?.ToLower() == "desc"
                        ? query.OrderByDescending(r => r.CashablePoints)
                        : query.OrderBy(r => r.CashablePoints),
                    "createddate" => pagingSorting.SortDirection?.ToLower() == "desc"
                        ? query.OrderByDescending(r => r.CreatedDate)
                        : query.OrderBy(r => r.CreatedDate),
                    _ => query.OrderByDescending(r => r.CreatedDate)
                };

                var totalRecords = await sortedQuery.CountAsync(cancellationToken);

                var pagedData = await sortedQuery
                    .Skip((pagingSorting.PageNumber - 1) * pagingSorting.PageSize)
                    .Take(pagingSorting.PageSize)
                    .ToListAsync(cancellationToken);

                return new PaginatedResult<Configuration_Reward>(
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
                throw new Exception($"Failed to get all rewards: {ex.Message}", ex);
            }
        }
    }
}

