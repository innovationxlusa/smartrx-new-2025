using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMSBackend.Domain.Entities
{
    [Table("Smartrx_PatientReward")]
    public class SmartRx_PatientReward : BaseEntity
    {     

        //[Required]
        //public long UserId { get; set; }
        //[ForeignKey("UserId")]
        //public virtual SmartRxUserEntity User { get; set; }
        public long? SmartRxMasterId { get; set; }
        [ForeignKey("SmartRxMasterId")]
        public virtual SmartRx_MasterEntity? SmartRxMaster { get; set; }

        public long? PrescriptionId { get; set; }
        [ForeignKey("PrescriptionId")]
        public virtual Prescription_UploadEntity? Prescription { get; set; }
        [Required]
        public long PatientId { get; set; }
        [ForeignKey("PatientId")]
        public virtual SmartRx_PatientProfileEntity PatientProfile { get; set; }
      

        [Required]
        public long BadgeId { get; set; }
        // --- Navigation Properties ---
        [ForeignKey(nameof(BadgeId))]
        public virtual Configuration_RewardBadge RewardBadge { get; set; }

        // --- Points Tracking ---
        [Column(TypeName = "decimal(18,2)")]
        public int EarnedNonCashablePoints { get; set; }
        [Column(TypeName = "decimal(18,2)")]
        public int ConsumedNonCashablePoints { get; set; }
        [Column(TypeName = "decimal(18,2)")]
        public int TotalNonCashablePoints { get; set; }


        [Column(TypeName = "decimal(18,2)")]
        public int EarnedCashablePoints { get; set; }
        [Column(TypeName = "decimal(18,2)")]
        public int ConsumedCashablePoints { get; set; }
        [Column(TypeName = "decimal(18,2)")]
        public int TotalCashablePoints { get; set; }

        // --- Monetary Tracking ---
        [Column(TypeName = "decimal(18,2)")]
        public decimal? EarnedMoney { get; set; }

        [Column(TypeName = "decimal(18,2)")]
        public decimal? ConsumedMoney { get; set; }

        [Column(TypeName = "decimal(18,2)")]
        public decimal? TotalMoney { get; set; }

        [Column(TypeName = "decimal(18,2)")]
        public decimal? EncashMoney { get; set; }

        [MaxLength(500)]
        public string? Remarks { get; set; }

      
    }
}
