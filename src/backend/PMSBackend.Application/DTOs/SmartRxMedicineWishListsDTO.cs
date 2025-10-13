using PMSBackend.Application.CommonServices;

namespace PMSBackend.Application.DTOs
{
    public class SmartRxMedicineWishListsDTO
    {
        public List<SmartRxMedicineWishListDTO>? MedicineWishlist { get; set; }
        public ApiResponseResult? ApiResponseResult { get; set; }
    }
}
