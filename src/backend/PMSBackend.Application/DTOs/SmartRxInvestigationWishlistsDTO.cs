using PMSBackend.Application.CommonServices;

namespace PMSBackend.Application.DTOs
{
    public class SmartRxInvestigationWishlistsDTO
    {
        public List<SmartRxInvestigationWishListDTO> investigationWishlist { get; set; }
        public ApiResponseResult ApiResponseResult { get; set; }
    }
}
