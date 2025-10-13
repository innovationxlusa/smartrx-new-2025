using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMSBackend.Application.DTOs
{
    public class PatientRewardSummaryDTO
    {
        public long UserId { get; set; }
        public long PatientId { get; set; }
        public int TotalEarnedNonCashablePoints { get; set; }
        public int TotalConsumedNonCashablePoints { get; set; }
        public int TotalNonCashablePoints { get; set; }
        public int TotalEarnedCashablePoints { get; set; }
        public int TotalConsumedCashablePoints { get; set; }
        public int TotalCashablePoints { get; set; }
        public decimal TotalEarnedMoney { get; set; }
        public decimal TotalConsumedMoney { get; set; }
        public decimal TotalMoney { get; set; }
        public decimal TotalEncashMoney { get; set; }
    }
}
