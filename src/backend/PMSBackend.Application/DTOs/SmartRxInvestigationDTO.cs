using PMSBackend.Application.CommonServices;

namespace PMSBackend.Application.DTOs
{
    public class SmartRxInvestigationDTO
    {
        public List<SmartRxInvestigationListDTO> smartRxInsiderInvestigationList { get; set; }
        public ApiResponseResult ApiResponseResult { get; set; }
    }
}
