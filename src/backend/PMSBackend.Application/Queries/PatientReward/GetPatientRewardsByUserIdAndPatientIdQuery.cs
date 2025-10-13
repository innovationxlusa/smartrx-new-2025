using MediatR;
using PMSBackend.Domain.CommonDTO;
using PMSBackend.Domain.Entities;
using PMSBackend.Domain.Repositories;
using PMSBackend.Domain.SharedContract;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace PMSBackend.Application.Queries.PatientReward
{
    public class GetPatientRewardsByUserIdAndPatientIdQuery : IRequest<PaginatedResult<PatientRewardContract>>
    {
        public long UserId { get; set; }
        public long? PatientId { get; set; }
        public int PageNumber { get; set; } = 1;
        public int PageSize { get; set; } = 10;
        public string? SortBy { get; set; }
        public string? SortDirection { get; set; }
    }

    public class GetPatientRewardsByUserIdAndPatientIdQueryHandler 
        : IRequestHandler<GetPatientRewardsByUserIdAndPatientIdQuery, PaginatedResult<PatientRewardContract>>
    {
        private readonly IPatientRewardRepository _patientRewardRepository;

        public GetPatientRewardsByUserIdAndPatientIdQueryHandler(IPatientRewardRepository patientRewardRepository)
        {
            _patientRewardRepository = patientRewardRepository;
        }

        public async Task<PaginatedResult<PatientRewardContract>> Handle(
            GetPatientRewardsByUserIdAndPatientIdQuery request, 
            CancellationToken cancellationToken)
        {
            var pagingParams = new PagingSortingParams
            {
                PageNumber = request.PageNumber,
                PageSize = request.PageSize,
                SortBy = request.SortBy ?? "CreatedDate",
                SortDirection = request.SortDirection ?? "desc"
            };

            var result = await _patientRewardRepository.GetPatientRewardsByUserIdAndPatientIdAsync(
                request.UserId,
                request.PatientId,
                pagingParams,
                cancellationToken);

            // Map to contract
            var contracts = result.Data.Select(pr => new PatientRewardContract
            {
                Id = pr.Id,
                SmartRxMasterId = pr.SmartRxMasterId,
                PrescriptionId = pr.PrescriptionId,
                PatientId = pr.PatientId,
                BadgeId = pr.BadgeId,
                BadgeName = pr.RewardBadge?.Name,
                BadgeDescription = pr.RewardBadge?.Description,
                PatientFirstName = pr.PatientProfile?.FirstName,
                PatientLastName = pr.PatientProfile?.LastName,
                PatientCode = pr.PatientProfile?.PatientCode,
                EarnedNonCashablePoints = pr.EarnedNonCashablePoints,
                ConsumedNonCashablePoints = pr.ConsumedNonCashablePoints,
                TotalNonCashablePoints = pr.TotalNonCashablePoints,
                EarnedCashablePoints = pr.EarnedCashablePoints,
                ConsumedCashablePoints = pr.ConsumedCashablePoints,
                TotalCashablePoints = pr.TotalCashablePoints,
                EarnedMoney = pr.EarnedMoney,
                ConsumedMoney = pr.ConsumedMoney,
                TotalMoney = pr.TotalMoney,
                EncashMoney = pr.EncashMoney,
                Remarks = pr.Remarks,
                CreatedDate = pr.CreatedDate,
                ModifiedDate = pr.ModifiedDate
            }).ToList();

            return new PaginatedResult<PatientRewardContract>(
                contracts,
                result.TotalRecords,
                result.PageNumber,
                result.PageSize,
                result.SortBy,
                result.SortDirection,
                null);
        }
    }
}

