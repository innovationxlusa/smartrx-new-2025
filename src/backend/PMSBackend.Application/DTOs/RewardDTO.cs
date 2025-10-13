using System;

namespace PMSBackend.Application.DTOs
{
    public class RewardDTO
    {
        public long Id { get; set; }
        public string Heading { get; set; }
        public string? Details { get; set; }
        public bool IsNegativePointAllowed { get; set; }
        public int NonCashablePoints { get; set; }
        public bool IsCashable { get; set; }
        public int? CashablePoints { get; set; }
        public long CreatedById { get; set; }
        public DateTime? CreatedDate { get; set; }
        public long? ModifiedById { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public bool? IsActive { get; set; }
    }
}

