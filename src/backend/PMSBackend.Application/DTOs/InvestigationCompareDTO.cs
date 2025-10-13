using PMSBackend.Application.CommonServices;
using PMSBackend.Domain.SharedContract;

namespace PMSBackend.Application.DTOs
{
    public class InvestigationCompareDTO
    {
        public List<long> SourceTestIds { get; set; }

        public IEnumerable<InvestigationTestDTO> SelectedOrRecommendedTestList { get; set; }
        public PaginatedResult<InvestigationTestDTO> TestCentersListWithBranch { get; set; }
        public PaginatedResult<InvestigationTestDTO> ComparedTestList { get; set; }
        public ApiResponseResult ApiResponseResult { get; set; }
    }
}
