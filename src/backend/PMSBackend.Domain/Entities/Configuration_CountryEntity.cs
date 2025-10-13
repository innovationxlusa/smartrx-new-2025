﻿using System.ComponentModel.DataAnnotations.Schema;

namespace PMSBackend.Domain.Entities
{
    [Table("Configuration_Country")]
    public class Configuration_CountryEntity : BaseEntity
    {
        [Column(TypeName = "nvarchar(500)")]
        public string Name { get; set; }
        [Column(TypeName = "nchar(3)")]
        public string Code { get; set; }
        public virtual IList<Configuration_CityEntity> Cities { get; set; }
    }
}
