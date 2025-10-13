using MediatR;
using PMSBackend.Application.DTOs;
using PMSBackend.Domain.Entities;
using PMSBackend.Domain.Repositories;
using System.Threading;
using System.Threading.Tasks;

namespace PMSBackend.Application.Queries.Reward
{
    public class GetRewardByIdQuery : IRequest<RewardDTO?>
    {
        public long Id { get; set; }
    }

    public class GetRewardByIdQueryHandler : IRequestHandler<GetRewardByIdQuery, RewardDTO?>
    {
        private readonly IRewardRepository _rewardRepository;

        public GetRewardByIdQueryHandler(IRewardRepository rewardRepository)
        {
            _rewardRepository = rewardRepository;
        }

        public async Task<RewardDTO?> Handle(GetRewardByIdQuery request, CancellationToken cancellationToken)
        {
            var result = await _rewardRepository.GetRewardByIdAsync(request.Id, cancellationToken);

            if (result == null)
            {
                return null;
            }

            return new RewardDTO
            {
                Id = result.Id,
                Heading = result.Heading,
                Details = result.Details,
                IsNegativePointAllowed = result.IsNegativePointAllowed,
                NonCashablePoints = result.NonCashablePoints,
                IsCashable = result.IsCashable,
                CashablePoints = result.CashablePoints,
                CreatedById = result.CreatedById ?? 0,
                CreatedDate = result.CreatedDate,
                ModifiedById = result.ModifiedById,
                ModifiedDate = result.ModifiedDate,
                IsActive = result.IsActive
            };
        }
    }
}


