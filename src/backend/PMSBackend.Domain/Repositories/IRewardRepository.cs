using PMSBackend.Domain.CommonDTO;
using PMSBackend.Domain.Entities;
using PMSBackend.Domain.SharedContract;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

namespace PMSBackend.Domain.Repositories
{
    public interface IRewardRepository
    {
        /// <summary>
        /// Creates a new reward configuration
        /// </summary>
        Task<Configuration_Reward> CreateRewardAsync(Configuration_Reward reward, CancellationToken cancellationToken);

        /// <summary>
        /// Updates an existing reward configuration
        /// </summary>
        Task<Configuration_Reward> UpdateRewardAsync(Configuration_Reward reward, CancellationToken cancellationToken);

        /// <summary>
        /// Deletes a reward configuration by ID
        /// </summary>
        Task<bool> DeleteRewardAsync(long id, CancellationToken cancellationToken);

        /// <summary>
        /// Gets a reward configuration by ID
        /// </summary>
        Task<Configuration_Reward?> GetRewardByIdAsync(long id, CancellationToken cancellationToken);

        /// <summary>
        /// Gets all reward configurations with pagination
        /// </summary>
        Task<PaginatedResult<Configuration_Reward>> GetAllRewardsAsync(
            PagingSortingParams pagingSorting,
            CancellationToken cancellationToken);
    }
}

