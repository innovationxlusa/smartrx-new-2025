using MediatR;
using PMSBackend.Application.DTOs;
using PMSBackend.Domain.Repositories;
using System.Threading;
using System.Threading.Tasks;

namespace PMSBackend.Application.Queries.PatientReward
{
    public class GetPatientRewardsSummaryQuery : IRequest<PatientRewardSummaryDTO?>
    {
        public long UserId { get; set; }
        public long? PatientId { get; set; }
    }

    public class GetPatientRewardsSummaryQueryHandler 
        : IRequestHandler<GetPatientRewardsSummaryQuery, PatientRewardSummaryDTO?>
    {
        private readonly IPatientRewardRepository _patientRewardRepository;

        public GetPatientRewardsSummaryQueryHandler(IPatientRewardRepository patientRewardRepository)
        {
            _patientRewardRepository = patientRewardRepository;
        }

        public async Task<PatientRewardSummaryDTO?> Handle(
            GetPatientRewardsSummaryQuery request, 
            CancellationToken cancellationToken)
        {
            var result = await _patientRewardRepository.GetPatientRewardsSummaryAsync(
                request.UserId,
                request.PatientId,
                cancellationToken);

            if (result == null)
            {
                return null;
            }

            // Map to DTO
            return new PatientRewardSummaryDTO
            {
                UserId = result.UserId,
                PatientId = result.PatientId,
                TotalEarnedNonCashablePoints = result.TotalEarnedNonCashablePoints,
                TotalConsumedNonCashablePoints = result.TotalConsumedNonCashablePoints,
                TotalNonCashablePoints = result.TotalNonCashablePoints,
                TotalEarnedCashablePoints = result.TotalEarnedCashablePoints,
                TotalConsumedCashablePoints = result.TotalConsumedCashablePoints,
                TotalCashablePoints = result.TotalCashablePoints,
                TotalEarnedMoney = result.TotalEarnedMoney,
                TotalConsumedMoney = result.TotalConsumedMoney,
                TotalMoney = result.TotalMoney,
                TotalEncashMoney = result.TotalEncashMoney
            };
        }
    }
}

