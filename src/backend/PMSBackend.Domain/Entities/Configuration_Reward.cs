using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMSBackend.Domain.Entities
{
    [Table("Configuration_Reward")]
    public class Configuration_Reward : BaseEntity
    {
        [Required, MaxLength(150)]
        public string Heading { get; set; }

        [MaxLength(500)]
        public string? Details { get; set; }

        public bool IsNegativePointAllowed { get; set; }

        // Non-cashable points limit or base value
        public int NonCashablePoints { get; set; }

        /// <summary>
        /// 1 = Cashable, 0 = Non-cashable
        /// </summary>
        public bool IsCashable { get; set; }

        public int? CashablePoints { get; set; }
        public bool? IsActive { get; set; }
    }
}
