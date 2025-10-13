using System.ComponentModel.DataAnnotations;
using PMSBackend.Domain.CommonDTO;

namespace PMSBackend.Application.DTOs
{
    public class PatientPrescriptionByTypeRequestDTO
    {
        [Required]
        public long UserId { get; set; }

       
        public long? PatientId { get; set; }

        [Required]
        [StringLength(20)]
        public string PrescriptionType { get; set; } // "smartrx", "waiting", "uncategorized"

        [Required]
        public PagingSortingParams PagingSorting { get; set; }
    }
}
