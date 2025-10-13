using PMSBackend.Application.CommonServices;
using PMSBackend.Domain.SharedContract;

namespace PMSBackend.Application.DTOs
{
    public class MedicineCompareDTO
    {
        public MedicineInfoDto SourceMedicine { get; set; }
        public PaginatedResult<MedicineInfoDto> ComparedMedicine { get; set; }
        public List<string> Differences { get; set; }
        public ApiResponseResult ApiResponseResult { get; set; }
    }
}
