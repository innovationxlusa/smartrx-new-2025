using MediatR;
using PMSBackend.Application.DTOs;
using PMSBackend.Domain.CommonDTO;
using PMSBackend.Domain.Entities;
using PMSBackend.Domain.Repositories;
using PMSBackend.Domain.SharedContract;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace PMSBackend.Application.Queries.RewardBadge
{
    public class GetAllRewardBadgesQuery : IRequest<PaginatedResult<RewardBadgeDTO>>
    {
        public int PageNumber { get; set; } = 1;
        public int PageSize { get; set; } = 10;
        public string? SortBy { get; set; }
        public string? SortDirection { get; set; }
    }

    public class GetAllRewardBadgesQueryHandler : IRequestHandler<GetAllRewardBadgesQuery, PaginatedResult<RewardBadgeDTO>>
    {
        private readonly IRewardBadgeRepository _rewardBadgeRepository;

        public GetAllRewardBadgesQueryHandler(IRewardBadgeRepository rewardBadgeRepository)
        {
            _rewardBadgeRepository = rewardBadgeRepository;
        }

        public async Task<PaginatedResult<RewardBadgeDTO>> Handle(GetAllRewardBadgesQuery request, CancellationToken cancellationToken)
        {
            var responseResult = new RewardBadgesDTO();

            var pagingParams = new PagingSortingParams
            {
                PageNumber = request.PageNumber,
                PageSize = request.PageSize,
                SortBy = request.SortBy ?? "CreatedDate",
                SortDirection = request.SortDirection ?? "desc"
            };

            var result = await _rewardBadgeRepository.GetAllRewardBadgesAsync(pagingParams, cancellationToken);

            // Map to DTOs
            var dtos = result.Data.Select(rb => new RewardBadgeDTO
            {
                Id = rb.Id,
                Name = rb.Name,
                Description = rb.Description,
                CreatedById = rb.CreatedById ?? 0,
                CreatedDate = rb.CreatedDate,
                ModifiedById = rb.ModifiedById,
                ModifiedDate = rb.ModifiedDate,
                IsActive = rb.IsActive
            }).ToList();

            return new PaginatedResult<RewardBadgeDTO>(
                dtos,
                result.TotalRecords,
                result.PageNumber,
                result.PageSize,
                result.SortBy,
                result.SortDirection,
                null);
        }
    }
}

