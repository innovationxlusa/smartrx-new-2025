using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMSBackend.Domain.Entities
{

    [Table("Configuration_RewardBadge")]
    public class Configuration_RewardBadge:BaseEntity
    {
        [Required, MaxLength(150)]
        public string Name { get; set; }

        [MaxLength(500)]
        public string? Description { get; set; }
        public bool? IsActive { get; set; }

        // Navigation property: multiple rewards or patient rewards can link to a badge
        public virtual ICollection<SmartRx_PatientReward>? PatientRewards { get; set; }
    }
}

