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
    public class RewardBadgeRepository : IRewardBadgeRepository
    {
        private readonly PMSDbContext _dbContext;

        public RewardBadgeRepository(PMSDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<Configuration_RewardBadge> CreateRewardBadgeAsync(Configuration_RewardBadge rewardBadge, CancellationToken cancellationToken)
        {
            try
            {
                rewardBadge.CreatedDate = DateTime.UtcNow;
                rewardBadge.IsActive = true;

                await _dbContext.Configuration_RewardBadge.AddAsync(rewardBadge, cancellationToken);
                await _dbContext.SaveChangesAsync(cancellationToken);

                return rewardBadge;
            }
            catch (Exception ex)
            {
                throw new Exception($"Failed to create reward badge: {ex.Message}", ex);
            }
        }

        public async Task<Configuration_RewardBadge> UpdateRewardBadgeAsync(Configuration_RewardBadge rewardBadge, CancellationToken cancellationToken)
        {
            try
            {
                var existingBadge = await _dbContext.Configuration_RewardBadge
                    .FirstOrDefaultAsync(rb => rb.Id == rewardBadge.Id, cancellationToken);

                if (existingBadge == null)
                {
                    throw new Exception($"Reward badge with ID {rewardBadge.Id} not found");
                }

                // Update fields
                existingBadge.Name = rewardBadge.Name;
                existingBadge.Description = rewardBadge.Description;
                existingBadge.IsActive = rewardBadge.IsActive!=null?rewardBadge.IsActive:existingBadge.IsActive;
                existingBadge.ModifiedById = rewardBadge.ModifiedById;
                existingBadge.ModifiedDate = DateTime.UtcNow;

                _dbContext.Configuration_RewardBadge.Update(existingBadge);
                await _dbContext.SaveChangesAsync(cancellationToken);

                return existingBadge;
            }
            catch (Exception ex)
            {
                throw new Exception($"Failed to update reward badge: {ex.Message}", ex);
            }
        }

        public async Task<bool> DeleteRewardBadgeAsync(int id, CancellationToken cancellationToken)
        {
            try
            {
                var badge = await _dbContext.Configuration_RewardBadge
                    .FirstOrDefaultAsync(rb => rb.Id == id, cancellationToken);

                if (badge == null)
                {
                    return false;
                }

                _dbContext.Configuration_RewardBadge.Remove(badge);
                await _dbContext.SaveChangesAsync(cancellationToken);

                return true;
            }
            catch (Exception ex)
            {
                throw new Exception($"Failed to delete reward badge: {ex.Message}", ex);
            }
        }

        public async Task<Configuration_RewardBadge?> GetRewardBadgeByIdAsync(int id, CancellationToken cancellationToken)
        {
            try
            {
                return await _dbContext.Configuration_RewardBadge
                    .FirstOrDefaultAsync(rb => rb.Id == id && rb.IsActive==true, cancellationToken);
            }
            catch (Exception ex)
            {
                throw new Exception($"Failed to get reward badge by ID: {ex.Message}", ex);
            }
        }

        public async Task<PaginatedResult<Configuration_RewardBadge>> GetAllRewardBadgesAsync(
            PagingSortingParams pagingSorting,
            CancellationToken cancellationToken)
        {
            try
            {
                if (pagingSorting.PageNumber <= 0) pagingSorting.PageNumber = 1;
                if (pagingSorting.PageSize <= 0) pagingSorting.PageSize = 10;

                var query = _dbContext.Configuration_RewardBadge
                    .Where(rb => rb.IsActive == true)
                    .AsQueryable();

                // Apply sorting
                IQueryable<Configuration_RewardBadge> sortedQuery = pagingSorting.SortBy?.ToLower() switch
                {
                    "name" => pagingSorting.SortDirection?.ToLower() == "desc"
                        ? query.OrderByDescending(rb => rb.Name)
                        : query.OrderBy(rb => rb.Name),
                    "createddate" => pagingSorting.SortDirection?.ToLower() == "desc"
                        ? query.OrderByDescending(rb => rb.CreatedDate)
                        : query.OrderBy(rb => rb.CreatedDate),
                    _ => query.OrderByDescending(rb => rb.CreatedDate)
                };

                var totalRecords = await sortedQuery.CountAsync(cancellationToken);

                var pagedData = await sortedQuery
                    .Skip((pagingSorting.PageNumber - 1) * pagingSorting.PageSize)
                    .Take(pagingSorting.PageSize)
                    .ToListAsync(cancellationToken);

                return new PaginatedResult<Configuration_RewardBadge>(
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
                throw new Exception($"Failed to get all reward badges: {ex.Message}", ex);
            }
        }
    }
}

