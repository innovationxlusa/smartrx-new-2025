using Microsoft.EntityFrameworkCore;
using PMSBackend.Databases.Data;
using PMSBackend.Domain.Entities;
using PMSBackend.Domain.Repositories;
using PMSBackend.Domain.SharedContract;
using PMSBackend.Domain.CommonDTO;
using System.ComponentModel.DataAnnotations.Schema;

namespace PMSBackend.Databases.Repositories
{
    public class PatientProfileRepository : IPatientProfileRepository
    {
        private readonly PMSDbContext _dbContext;
        public PatientProfileRepository(PMSDbContext dbContext)
        {
            _dbContext = dbContext;
        }
        // Method to get patient profile with relatives by patient ID

        public async Task<PatientWithRelativesContract?> GetPatientProfileWithRelativesById(long id, CancellationToken cancellationToken)
        {
            try
            {
                var patientWithRelatives = await _dbContext.Smartrx_PatientProfile
                    .Where(p => p.Id == id)
                    .Select(p => new PatientWithRelativesContract
                    {
                        Id = p.Id,
                        PatientCode = p.PatientCode,
                        FirstName = p.FirstName,
                        LastName = p.LastName,
                        NickName = p.NickName,
                        Age = p.Age,
                        AgeYear = p.AgeYear,
                        AgeMonth = p.AgeMonth,
                        DateOfBirth = p.DateOfBirth,
                        Gender = p.Gender,
                        GenderString = p.Gender == (int)Gender.Male ? Gender.Male.ToString() : Gender.Female.ToString(),
                        BloodGroup = p.BloodGroup,
                        Height = p.Height,
                        HeightFeet=p.HeightFeet??0,
                        HeightInches=p.HeightInches ?? 0,
                        HeightMeasurementUnit=p.HeightUnit.Name,
                        Weight = p.Weight,
                        WeightMeasurementUnit=p.WeightUnit.Name,
                        PhoneNumber = p.PhoneNumber,
                        Email = p.Email,
                        ProfilePhotoName = p.ProfilePhotoName,
                        ProfilePhotoPath = p.ProfilePhotoPath,
                        Address = p.Address,
                        PoliceStationId = p.PoliceStationId,
                        CityId = p.CityId,
                        PostalCode = p.PostalCode,
                        EmergencyContact = p.EmergencyContact,
                        MaritalStatus = p.MaritalStatus,
                        Profession = p.Profession,
                        IsExistingPatient = p.IsExistingPatient,
                        ExistingPatientId = p.ExistingPatientId,
                        ProfileProgress = p.ProfileProgress,
                        Relatives = _dbContext.Smartrx_PatientProfile
                            .Where(r => r.RelatedToPatientId == p.Id && r.IsRelative == true)
                            .Select(r => new RelativeContract
                            {
                                Id = r.Id,
                                PatientCode = r.PatientCode,
                                FirstName = r.FirstName,
                                LastName = r.LastName,
                                NickName = r.NickName,
                                Age = r.Age,
                                AgeYear = r.AgeYear,
                                AgeMonth = r.AgeMonth,
                                DateOfBirth = r.DateOfBirth,
                                Gender = r.Gender,
                                BloodGroup = r.BloodGroup,
                                Height = r.Height,
                                PhoneNumber = r.PhoneNumber,
                                Email = r.Email,
                                ProfilePhotoName = r.ProfilePhotoName,
                                ProfilePhotoPath = r.ProfilePhotoPath,
                                Address = r.Address,
                                PoliceStationId = r.PoliceStationId,
                                CityId = r.CityId,
                                PostalCode = r.PostalCode,
                                EmergencyContact = r.EmergencyContact,
                                MaritalStatus = r.MaritalStatus,
                                Profession = r.Profession,
                                IsExistingPatient = r.IsExistingPatient,
                                ExistingPatientId = r.ExistingPatientId,
                                IsRelative = r.IsRelative,
                                RelatedToPatientId = r.RelatedToPatientId,
                                RelationToPatient = r.RelationToPatient,
                                ProfileProgress = r.ProfileProgress
                            })
                            .ToList(),
                        IsActive = p.IsActive,
                        TotalPrescriptions = _dbContext.Smartrx_Master
                            .Where(sm => sm.PatientId == p.Id && 
                                        sm.IsRecommended == true && 
                                        sm.IsApproved == true && 
                                        sm.IsCompleted == true)
                            .Count(),
                        RxType = _dbContext.Smartrx_Master
                            .Where(sm => sm.PatientId == p.Id && 
                                        sm.IsRecommended == true && 
                                        sm.IsApproved == true && 
                                        sm.IsCompleted == true)
                            .Any() ? "SmartRx" :
                            _dbContext.Prescription_UploadedPrescription
                            .Where(pr => pr.PatientId == p.Id && 
                                        pr.IsSmartRxRequested == true && 
                                        (pr.IsCompleted == null || pr.IsCompleted == false))
                            .Any() ? "Waiting" : "File Only"
                    })
                    .FirstOrDefaultAsync();
                //if (patientWithRelatives is not null)
                //{
                //    var vitalsWeight = await _dbContext.Smartrx_Vital.Where(v => v.Vital.Name == "Weight" && v.PatientId==id).ToListAsync(cancellationToken);
                //    var weight = vitalsWeight!.Where(v => v.Vital.ApplicableEntity == patientWithRelatives.GenderString).FirstOrDefault();
                //    if(weight is not null)patientWithRelatives.Weight = weight!.VitalValue;
                //    patientWithRelatives.WeightMeasurementUnit = weight.Vital.Unit.Name;
                //    var vitalsHeight = await _dbContext.Smartrx_Vital.Where(v => v.Vital.Name == "Height" && v.PatientId == id).ToListAsync(cancellationToken);
                //    var height = vitalsHeight!.Where(v => v.Vital.ApplicableEntity == patientWithRelatives.GenderString).FirstOrDefault();
                //    patientWithRelatives.Height = height!.VitalValue.ToString() + " "+ height.Vital.Unit.MeasurementUnit;
                //} 


                return patientWithRelatives;
            }
            catch (Exception ex)
            {
                throw new Exception("Failed to load patient with relatives: " + ex.Message);
            }


        }

        public async Task<IList<PatientDropdown>> GetPatientDropdownInfoAsync(CancellationToken cancellationToken)
        {
            try
            {
                var patientDropdown = await _dbContext.Smartrx_PatientProfile.Where(p => p.IsActive == true).Select(p => new PatientDropdown()
                {
                    PatientId = p.Id,
                    PatientName = p.FirstName + " " + p.LastName + " " + p.NickName
                }).ToListAsync(cancellationToken);
                return patientDropdown;
            }
            catch (Exception)
            {

                throw;
            }

        }

        public async Task<bool> IsExistsPatientProfileDetails(long patientId)
        {
            var patient = await _dbContext.Smartrx_PatientProfile
                .FirstOrDefaultAsync(p => p.Id == patientId);

            if (patient == null)
            {
                return false;
            }
            return true;
        }

        public async Task<PatientWithRelativesContract> EditPatientDetailsAsync(long patientId, long loginUserId, PatientWithRelativesContract patientDetails, CancellationToken cancellationToken)
        {
            // Fetch the existing patient record
            var patient = await _dbContext.Smartrx_PatientProfile
                .FirstOrDefaultAsync(p => p.Id == patientId);

            var heightUnit = await _dbContext.Configuration_Unit.Where(u => u.Type == "Vital" && u.Name == "Height" && u.MeasurementUnit == patientDetails.HeightMeasurementUnit.ToLower()).FirstOrDefaultAsync(cancellationToken);
            var weightUnit = await _dbContext.Configuration_Unit.Where(u => u.Type == "Vital" && u.Name == "Weight" && u.MeasurementUnit == patientDetails.WeightMeasurementUnit.ToLower()).FirstOrDefaultAsync(cancellationToken);

            
            // Update fields using null coalescing operator
            patient.FirstName = patientDetails.FirstName ?? patient.FirstName;
            patient.LastName = patientDetails.LastName ?? patient.LastName;
            patient.NickName = patientDetails.NickName ?? patient.NickName;
            patient.Email = patientDetails.Email ?? patient.Email;
            patient.Age = patientDetails.Age ?? patient.Age;
            patient.AgeYear = patientDetails.AgeYear ?? patient.AgeYear;
            patient.AgeMonth = patientDetails.AgeMonth ?? patient.AgeMonth;
            patient.DateOfBirth = patientDetails.DateOfBirth ?? patient.DateOfBirth;
            patient.Gender = (patientDetails.Gender!=1|| patientDetails.Gender != 2) ? patient.Gender:patientDetails.Gender ?? 0;
            patient.Height = patientDetails.Height ?? patient.Height;
            patient.HeightFeet = patientDetails.HeightFeet>=0? patientDetails.HeightFeet : patient.HeightFeet;
            patient.HeightInches = patientDetails.HeightInches>=0 ? patientDetails.HeightInches: patient.HeightInches;
            patient.HeightMeasurementUnitId = heightUnit!.Id;
            patient.Weight = patientDetails.Weight ?? patient.Weight;
            patient.WeightMeasurementUnitId = weightUnit!.Id;
            patient.BloodGroup = patientDetails.BloodGroup ?? patient.BloodGroup;
            patient.PhoneNumber = patientDetails.PhoneNumber ?? patient.PhoneNumber;
            // Save generated image name/path if provided; otherwise keep values from DTO (which may be existing)
            patient.ProfilePhotoName = !string.IsNullOrWhiteSpace(patientDetails.ProfilePhotoName) ? patientDetails.ProfilePhotoName : patient.ProfilePhotoName;
            patient.ProfilePhotoPath = !string.IsNullOrWhiteSpace(patientDetails.ProfilePhotoPath) ? patientDetails.ProfilePhotoPath : patient.ProfilePhotoPath;
            patient.Address = patientDetails.Address ?? patient.Address;
            patient.CityId = patientDetails.CityId ?? patient.CityId;
            patient.PoliceStationId = patientDetails.PoliceStationId ?? patient.PoliceStationId;
            patient.PostalCode = patientDetails.PostalCode ?? patient.PostalCode;
            patient.EmergencyContact = patientDetails.EmergencyContact ?? patient.EmergencyContact;
            patient.MaritalStatus = patientDetails.MaritalStatus ?? patient.MaritalStatus;
            patient.Profession = patientDetails.Profession ?? patient.Profession;
            patient.IsExistingPatient = patientDetails.IsExistingPatient ?? patient.IsExistingPatient;
            patient.ExistingPatientId = patientDetails.ExistingPatientId ?? patient.ExistingPatientId;
            patient.IsRelative = patientDetails.IsRelative ?? patient.IsRelative;
            patient.RelationToPatient = patientDetails.RelationToPatient ?? patient.RelationToPatient;
            patient.RelatedToPatientId = patientDetails.RelatedToPatientId ?? patient.RelatedToPatientId;
            patient.ProfileProgress = patientDetails.ProfileProgress ?? patient.ProfileProgress;
            
            patient.ModifiedById = loginUserId;
            patient.ModifiedDate = DateTime.Now;

            // Relatives: update only relation fields for existing relative rows
            if (patientDetails.Relatives is not null && patientDetails.Relatives.Count > 0)
            {
                var incomingById = patientDetails!.Relatives!
                    .Where(r => r.RelatedToPatientId > 0)
                    .ToDictionary(r => r.RelatedToPatientId, r => r);

                if (incomingById.Count > 0)
                {
                    var toUpdate = await _dbContext.Smartrx_PatientProfile
                        .Where(p => incomingById.Keys.Contains(p.Id))
                        .ToListAsync();

                    foreach (var relative in toUpdate)
                    {
                        var rel = incomingById[relative.Id];
                        relative.IsRelative = true;
                        relative.RelatedToPatientId = patientId;
                        relative.RelationToPatient = rel.RelationToPatient;
                        relative.ModifiedById = loginUserId;
                        relative.ModifiedDate = DateTime.Now;
                    }
                }
            }

            await _dbContext.SaveChangesAsync();
            _dbContext.Entry(patient).Reload();
            //_dbContext.Entry(patientVitals).Reload();
            //_dbContext.Entry(relatives).Reload();

            var pt = new PatientWithRelativesContract()
            {
                Id = patient.Id,
                PatientCode = patient.PatientCode,
                FirstName = patient.FirstName,
                LastName = patient.LastName,
                NickName = patient.NickName,
                PhoneNumber = patient.PhoneNumber,
                Email = patient.Email,
                Gender = patient.Gender,

                Age = patient.Age,
                AgeYear = patient.AgeYear,
                AgeMonth = patient.AgeMonth,

                Height = patient.HeightFeet + "ft " + patient.HeightInches + "in",
                HeightFeet = patient.HeightFeet ?? 0,
                HeightInches = patient.HeightInches ?? 0,
                HeightMeasurementUnit = heightUnit.MeasurementUnit,
                HeightMeasurementUnitId = patient.HeightMeasurementUnitId,
                Weight = patient.Weight,
                WeightMeasurementUnit = weightUnit.MeasurementUnit,
                WeightMeasurementUnitId = patient.WeightMeasurementUnitId,

                DateOfBirth = patient.DateOfBirth,
                BloodGroup = patient.BloodGroup,
                ProfilePhotoName = patient.ProfilePhotoName,
                ProfilePhotoPath = patient.ProfilePhotoPath,
                Address = patient.Address,
                CityId = patient.CityId,
                PoliceStationId = patient.PoliceStationId,
                PostalCode = patient.PostalCode,
                EmergencyContact = patient.EmergencyContact,
                MaritalStatus = patient.MaritalStatus,
                Profession = patient.Profession,
                IsExistingPatient = patient.IsExistingPatient,
                ExistingPatientId = patient.ExistingPatientId,
                IsRelative = patient.IsRelative,
                RelatedToPatientId = patient.RelatedToPatientId,
                RelationToPatient = patient.RelationToPatient,
                ProfileProgress = patient.ProfileProgress,

                IsActive = patient.IsActive,
                TotalPrescriptions = _dbContext.Smartrx_Master
                    .Where(sm => sm.PatientId == patientId && 
                                sm.IsRecommended == true && 
                                sm.IsApproved == true && 
                                sm.IsCompleted == true)
                    .Count(),
                RxType = _dbContext.Smartrx_Master
                    .Where(sm => sm.PatientId == patientId && 
                                sm.IsRecommended == true && 
                                sm.IsApproved == true && 
                                sm.IsCompleted == true)
                    .Any() ? "SmartRx" :
                    _dbContext.Prescription_UploadedPrescription
                    .Where(pr => pr.PatientId == patientId && 
                                pr.IsSmartRxRequested == true && 
                                (pr.IsCompleted == null || pr.IsCompleted == false))
                    .Any() ? "Waiting" : "File Only"
            };

            var relatives = await _dbContext.Smartrx_PatientProfile
                .Where(p => p.IsRelative == true && p.RelatedToPatientId == patientId)
                .ToListAsync();
            if(relatives != null)
            {
                var relativesContract = relatives!.Select(p => new RelativeContract()
                {
                    Id = p.Id,
                    RelatedToPatientId = p.RelatedToPatientId,
                    IsRelative = p.IsRelative,
                    RelationToPatient = p.RelationToPatient,

                }).ToList();
                pt.Relatives = relativesContract!;
            }
            return pt;
        }

        public async Task<IList<PatientWithRelativesContract>> GetAllPatientProfilesByUserIdAsync(long userId, CancellationToken cancellationToken)
        {
            try
            {
                var patientProfiles = await _dbContext.Smartrx_PatientProfile
                    .Where(p => p.UserId== userId && p.IsActive == true)
                    .Select(p => new PatientWithRelativesContract
                    {
                        Id = p.Id,
                        PatientCode = p.PatientCode,
                        FirstName = p.FirstName,
                        LastName = p.LastName,
                        NickName = p.NickName,
                        Age = p.Age,
                        AgeYear = p.AgeYear,
                        AgeMonth = p.AgeMonth,
                        DateOfBirth = p.DateOfBirth,
                        Gender = p.Gender,
                        GenderString = p.Gender == (int)Gender.Male ? Gender.Male.ToString() : Gender.Female.ToString(),
                        BloodGroup = p.BloodGroup,
                        Height = p.Height,
                        HeightFeet = p.HeightFeet ?? 0,
                        HeightInches = p.HeightInches ?? 0,
                        HeightMeasurementUnit = p.HeightUnit.Name,
                        Weight = p.Weight,
                        WeightMeasurementUnit = p.WeightUnit.Name,
                        PhoneNumber = p.PhoneNumber,
                        Email = p.Email,
                        ProfilePhotoName = p.ProfilePhotoName,
                        ProfilePhotoPath = p.ProfilePhotoPath,
                        Address = p.Address,
                        PoliceStationId = p.PoliceStationId,
                        CityId = p.CityId,
                        PostalCode = p.PostalCode,
                        EmergencyContact = p.EmergencyContact,
                        MaritalStatus = p.MaritalStatus,
                        Profession = p.Profession,
                        IsExistingPatient = p.IsExistingPatient,
                        ExistingPatientId = p.ExistingPatientId,
                        ProfileProgress = p.ProfileProgress,
                        Relatives = _dbContext.Smartrx_PatientProfile
                            .Where(r => r.RelatedToPatientId == p.Id && r.IsRelative == true)
                            .Select(r => new RelativeContract
                            {
                                Id = r.Id,
                                PatientCode = r.PatientCode,
                                FirstName = r.FirstName,
                                LastName = r.LastName,
                                NickName = r.NickName,
                                Age = r.Age,
                                AgeYear = r.AgeYear,
                                AgeMonth = r.AgeMonth,
                                DateOfBirth = r.DateOfBirth,
                                Gender = r.Gender,
                                BloodGroup = r.BloodGroup,
                                Height = r.Height,
                                PhoneNumber = r.PhoneNumber,
                                Email = r.Email,
                                ProfilePhotoName = r.ProfilePhotoName,
                                ProfilePhotoPath = r.ProfilePhotoPath,
                                Address = r.Address,
                                PoliceStationId = r.PoliceStationId,
                                CityId = r.CityId,
                                PostalCode = r.PostalCode,
                                EmergencyContact = r.EmergencyContact,
                                MaritalStatus = r.MaritalStatus,
                                Profession = r.Profession,
                                IsExistingPatient = r.IsExistingPatient,
                                ExistingPatientId = r.ExistingPatientId,
                                IsRelative = r.IsRelative,
                                RelatedToPatientId = r.RelatedToPatientId,
                                RelationToPatient = r.RelationToPatient,
                                ProfileProgress = r.ProfileProgress
                            })
                            .ToList(),
                        IsActive = p.IsActive,
                        TotalPrescriptions = _dbContext.Smartrx_Master
                            .Where(sm => sm.PatientId == p.Id && 
                                        sm.IsRecommended == true && 
                                        sm.IsApproved == true && 
                                        sm.IsCompleted == true)
                            .Count(),
                        RxType = _dbContext.Smartrx_Master
                            .Where(sm => sm.PatientId == p.Id && 
                                        sm.IsRecommended == true && 
                                        sm.IsApproved == true && 
                                        sm.IsCompleted == true)
                            .Any() ? "SmartRx" :
                            _dbContext.Prescription_UploadedPrescription
                            .Where(pr => pr.PatientId == p.Id && 
                                        pr.IsSmartRxRequested == true && 
                                        (pr.IsCompleted == null || pr.IsCompleted == false))
                            .Any() ? "Waiting" : "File Only"
                    })
                    .ToListAsync(cancellationToken);

                return patientProfiles;
            }
            catch (Exception ex)
            {
                throw new Exception("Failed to load patient profiles for user: " + ex.Message);
            }
        }

        public async Task<PaginatedResult<PatientWithRelativesContract>> GetAllPatientProfilesByUserIdWithPagingAsync(long userId, string RxType, string? searchKeyword, string? searchColumn, PagingSortingParams pagingSorting, CancellationToken cancellationToken)
        {
            try
            {
                if (pagingSorting.PageNumber <= 0) pagingSorting.PageNumber = 1;
                if (pagingSorting.PageSize <= 0) pagingSorting.PageSize = 10;

                var baseQuery = _dbContext.Smartrx_PatientProfile
                    .Where(p => p.UserId == userId && p.IsActive == true)
                    .Select(p => new PatientWithRelativesContract
                    {
                        Id = p.Id,
                        PatientCode = p.PatientCode,
                        FirstName = p.FirstName,
                        LastName = p.LastName,
                        NickName = p.NickName,
                        Age = p.Age,
                        AgeYear = p.AgeYear,
                        AgeMonth = p.AgeMonth,
                        DateOfBirth = p.DateOfBirth,
                        Gender = p.Gender,
                        GenderString = p.Gender == (int)Gender.Male ? Gender.Male.ToString() : Gender.Female.ToString(),
                        BloodGroup = p.BloodGroup,
                        Height = p.Height,
                        HeightFeet = p.HeightFeet ?? 0,
                        HeightInches = p.HeightInches ?? 0,
                        HeightMeasurementUnit = p.HeightUnit.Name,
                        Weight = p.Weight,
                        WeightMeasurementUnit = p.WeightUnit.Name,
                        PhoneNumber = p.PhoneNumber,
                        Email = p.Email,
                        ProfilePhotoName = p.ProfilePhotoName,
                        ProfilePhotoPath = p.ProfilePhotoPath,
                        Address = p.Address,
                        PoliceStationId = p.PoliceStationId,
                        CityId = p.CityId,
                        PostalCode = p.PostalCode,
                        EmergencyContact = p.EmergencyContact,
                        MaritalStatus = p.MaritalStatus,
                        Profession = p.Profession,
                        IsExistingPatient = p.IsExistingPatient,
                        ExistingPatientId = p.ExistingPatientId,
                        ProfileProgress = p.ProfileProgress,
                        Relatives = _dbContext.Smartrx_PatientProfile
                            .Where(r => r.RelatedToPatientId == p.Id && r.IsRelative == true)
                            .Select(r => new RelativeContract
                            {
                                Id = r.Id,
                                PatientCode = r.PatientCode,
                                FirstName = r.FirstName,
                                LastName = r.LastName,
                                NickName = r.NickName,
                                Age = r.Age,
                                AgeYear = r.AgeYear,
                                AgeMonth = r.AgeMonth,
                                DateOfBirth = r.DateOfBirth,
                                Gender = r.Gender,
                                BloodGroup = r.BloodGroup,
                                Height = r.Height,
                                PhoneNumber = r.PhoneNumber,
                                Email = r.Email,
                                ProfilePhotoName = r.ProfilePhotoName,
                                ProfilePhotoPath = r.ProfilePhotoPath,
                                Address = r.Address,
                                PoliceStationId = r.PoliceStationId,
                                CityId = r.CityId,
                                PostalCode = r.PostalCode,
                                EmergencyContact = r.EmergencyContact,
                                MaritalStatus = r.MaritalStatus,
                                Profession = r.Profession,
                                IsExistingPatient = r.IsExistingPatient,
                                ExistingPatientId = r.ExistingPatientId,
                                IsRelative = r.IsRelative,
                                RelatedToPatientId = r.RelatedToPatientId,
                                RelationToPatient = r.RelationToPatient,
                                ProfileProgress = r.ProfileProgress
                            })
                            .ToList(),
                        IsActive = p.IsActive,
                        TotalPrescriptions = _dbContext.Smartrx_Master
                            .Where(sm => sm.PatientId == p.Id && 
                                        sm.IsRecommended == true && 
                                        sm.IsApproved == true && 
                                        sm.IsCompleted == true)
                            .Count(),
                        RxType = _dbContext.Smartrx_Master
                            .Where(sm => sm.PatientId == p.Id && 
                                        sm.IsRecommended == true && 
                                        sm.IsApproved == true && 
                                        sm.IsCompleted == true)
                            .Any() ? "Smart Rx" :
                            _dbContext.Prescription_UploadedPrescription
                            .Where(pr => pr.PatientId == p.Id && 
                                        pr.IsSmartRxRequested == true && 
                                        (pr.IsCompleted == null || pr.IsCompleted == false))
                            .Any() ? "Waiting" : "File Only"
                    });

                // Apply search filter only if SearchKeyword is provided
                if (!string.IsNullOrWhiteSpace(searchKeyword))
                {
                    var searchTerm = searchKeyword.Trim().ToLower();
                    
                    // Only apply search if the keyword is not empty after trimming
                    if (!string.IsNullOrEmpty(searchTerm))
                    {
                        switch (searchColumn?.ToLower())
                        {
                            case "firstname":
                                baseQuery = baseQuery.Where(x => x.FirstName != null && x.FirstName.ToLower().Contains(searchTerm));
                                break;
                            case "lastname":
                                baseQuery = baseQuery.Where(x => x.LastName != null && x.LastName.ToLower().Contains(searchTerm));
                                break;
                            case "patientcode":
                                baseQuery = baseQuery.Where(x => x.PatientCode != null && x.PatientCode.ToLower().Contains(searchTerm));
                                break;
                            case "nickname":
                                baseQuery = baseQuery.Where(x => x.NickName != null && x.NickName.ToLower().Contains(searchTerm));
                                break;
                            case "phonenumber":
                                baseQuery = baseQuery.Where(x => x.PhoneNumber != null && x.PhoneNumber.ToLower().Contains(searchTerm));
                                break;
                            case "email":
                                baseQuery = baseQuery.Where(x => x.Email != null && x.Email.ToLower().Contains(searchTerm));
                                break;
                            case "address":
                                baseQuery = baseQuery.Where(x => x.Address != null && x.Address.ToLower().Contains(searchTerm));
                                break;
                            case "profession":
                                baseQuery = baseQuery.Where(x => x.Profession != null && x.Profession.ToLower().Contains(searchTerm));
                                break;
                            case "emergencycontact":
                                baseQuery = baseQuery.Where(x => x.EmergencyContact != null && x.EmergencyContact.ToLower().Contains(searchTerm));
                                break;
                            case "all":
                            default:
                                baseQuery = baseQuery.Where(x => 
                                    (x.FirstName != null && x.FirstName.ToLower().Contains(searchTerm)) ||
                                    (x.LastName != null && x.LastName.ToLower().Contains(searchTerm)) ||
                                    (x.PatientCode != null && x.PatientCode.ToLower().Contains(searchTerm)) ||
                                    (x.NickName != null && x.NickName.ToLower().Contains(searchTerm)) ||
                                    (x.PhoneNumber != null && x.PhoneNumber.ToLower().Contains(searchTerm)) ||
                                    (x.Email != null && x.Email.ToLower().Contains(searchTerm)) ||
                                    (x.Address != null && x.Address.ToLower().Contains(searchTerm)) ||
                                    (x.Profession != null && x.Profession.ToLower().Contains(searchTerm)) ||
                                    (x.EmergencyContact != null && x.EmergencyContact.ToLower().Contains(searchTerm)));
                                break;
                        }
                    }
                }

                // Get total count
                var totalRecords = await baseQuery.Where(p => p.RxType == RxType).CountAsync();

                // Apply sorting
                IQueryable<PatientWithRelativesContract> sortedQuery;
                switch (pagingSorting.SortBy?.ToLower())
                {
                    case "firstname":
                        sortedQuery = pagingSorting.SortDirection.ToLower() == "desc"
                            ? baseQuery.OrderByDescending(x => x.FirstName)
                            : baseQuery.OrderBy(x => x.FirstName);
                        break;
                    case "lastname":
                        sortedQuery = pagingSorting.SortDirection.ToLower() == "desc"
                            ? baseQuery.OrderByDescending(x => x.LastName)
                            : baseQuery.OrderBy(x => x.LastName);
                        break;
                    case "patientcode":
                        sortedQuery = pagingSorting.SortDirection.ToLower() == "desc"
                            ? baseQuery.OrderByDescending(x => x.PatientCode)
                            : baseQuery.OrderBy(x => x.PatientCode);
                        break;
                    case "age":
                        sortedQuery = pagingSorting.SortDirection.ToLower() == "desc"
                            ? baseQuery.OrderByDescending(x => x.Age)
                            : baseQuery.OrderBy(x => x.Age);
                        break;
                    case "dateofbirth":
                        sortedQuery = pagingSorting.SortDirection.ToLower() == "desc"
                            ? baseQuery.OrderByDescending(x => x.DateOfBirth)
                            : baseQuery.OrderBy(x => x.DateOfBirth);
                        break;
                    case "createddate":
                        sortedQuery = pagingSorting.SortDirection.ToLower() == "desc"
                            ? baseQuery.OrderByDescending(x => x.Id) // Using ID as proxy for created date
                            : baseQuery.OrderBy(x => x.Id);
                        break;
                    default:
                        sortedQuery = pagingSorting.SortDirection.ToLower() == "desc"
                            ? baseQuery.OrderByDescending(x => x.FirstName)
                            : baseQuery.OrderBy(x => x.FirstName);
                        break;
                }

                // Apply paging
                var pagedData = await sortedQuery
                    .Where(p=>p.RxType==RxType)
                    .Skip((pagingSorting.PageNumber - 1) * pagingSorting.PageSize)
                    .Take(pagingSorting.PageSize)
                    .ToListAsync();

                return new PaginatedResult<PatientWithRelativesContract>(
                    pagedData,
                    totalRecords,
                    pagingSorting.PageNumber,
                    pagingSorting.PageSize,
                    pagingSorting.SortBy,
                    pagingSorting.SortDirection,
                    null);
            }
            catch (Exception ex)
            {
                throw new Exception("Failed to load patient profiles with paging for user: " + ex.Message);
            }
        }

        public async Task<PatientWithRelativesContract> CreatePatientDetailsAsync(long userId, PatientWithRelativesContract patientDetails, CancellationToken cancellationToken)
        {
            try
            {
                // Generate patient code
                var patientCode = await GeneratePatientCodeAsync();

                var heightUnit = await _dbContext.Configuration_Unit.Where(u => u.Type == "Vital" && u.Name == "Height" && u.MeasurementUnit == patientDetails.HeightMeasurementUnit.ToLower()).FirstOrDefaultAsync(cancellationToken);
                var weightUnit = await _dbContext.Configuration_Unit.Where(u => u.Type == "Vital" && u.Name == "Weight" && u.MeasurementUnit == patientDetails.WeightMeasurementUnit.ToLower()).FirstOrDefaultAsync(cancellationToken);

                // Create new patient entity
                    var newPatient = new SmartRx_PatientProfileEntity
                {
                    PatientCode = patientCode,
                    FirstName = patientDetails.FirstName ?? string.Empty,
                    LastName = patientDetails.LastName ?? string.Empty,
                    NickName = patientDetails.NickName,
                    Age = patientDetails.Age,
                    AgeYear = patientDetails.AgeYear,
                    AgeMonth = patientDetails.AgeMonth,
                    DateOfBirth = patientDetails.DateOfBirth ?? DateTime.Now,
                    Gender = patientDetails.Gender ?? 0,
                    BloodGroup = patientDetails.BloodGroup,
                    Height = patientDetails.Height ?? string.Empty,
                    HeightFeet = patientDetails.HeightFeet,
                    HeightInches = patientDetails.HeightInches,
                    HeightMeasurementUnitId = heightUnit?.Id,
                    Weight = patientDetails.Weight ?? 0,
                    WeightMeasurementUnitId = weightUnit?.Id,
                    PhoneNumber = patientDetails.PhoneNumber ?? string.Empty,
                    Email = patientDetails.Email ?? string.Empty,
                    ProfilePhotoName = patientDetails.ProfilePhotoName,
                    ProfilePhotoPath = patientDetails.ProfilePhotoPath,
                    Address = patientDetails.Address ?? string.Empty,
                    PoliceStationId = patientDetails.PoliceStationId,
                    CityId = patientDetails.CityId,
                    PostalCode = patientDetails.PostalCode,
                    EmergencyContact = patientDetails.EmergencyContact,
                    MaritalStatus = patientDetails.MaritalStatus,
                    Profession = patientDetails.Profession,
                    IsExistingPatient = patientDetails.IsExistingPatient ?? false,
                    ExistingPatientId = patientDetails.ExistingPatientId,
                    IsRelative = patientDetails.IsRelative ?? false,
                    RelationToPatient = patientDetails.RelationToPatient,
                    RelatedToPatientId = patientDetails.RelatedToPatientId,
                    ProfileProgress = patientDetails.ProfileProgress ?? 0,
                    IsActive = patientDetails.IsActive ?? true,
                    UserId = userId,
                    CreatedDate = DateTime.Now,
                    CreatedById = userId
                };

                _dbContext.Smartrx_PatientProfile.Add(newPatient);
                await _dbContext.SaveChangesAsync(cancellationToken);

                // Handle relatives if provided
                if (patientDetails.Relatives != null && patientDetails.Relatives.Count > 0)
                {
                    var relatives = new List<SmartRx_PatientProfileEntity>();
                    foreach (var r in patientDetails.Relatives)
                    {
                        var relativeCode = await GeneratePatientCodeAsync();
                        relatives.Add(new SmartRx_PatientProfileEntity
                        {
                            PatientCode = relativeCode,
                            FirstName = r.FirstName ?? string.Empty,
                            LastName = r.LastName ?? string.Empty,
                            NickName = r.NickName,
                            Age = r.Age,
                            AgeYear = r.AgeYear,
                            AgeMonth = r.AgeMonth,
                            DateOfBirth = r.DateOfBirth ?? DateTime.Now,
                            Gender = r.Gender,
                            BloodGroup = r.BloodGroup,
                            Height = r.Height ?? string.Empty,
                            PhoneNumber = r.PhoneNumber ?? string.Empty,
                            Email = r.Email ?? string.Empty,
                            ProfilePhotoName = r.ProfilePhotoName,
                            ProfilePhotoPath = r.ProfilePhotoPath,
                            Address = r.Address ?? string.Empty,
                            PoliceStationId = r.PoliceStationId,
                            CityId = r.CityId,
                            PostalCode = r.PostalCode,
                            EmergencyContact = r.EmergencyContact,
                            MaritalStatus = r.MaritalStatus,
                            Profession = r.Profession,
                            IsExistingPatient = r.IsExistingPatient,
                            ExistingPatientId = r.ExistingPatientId,
                            IsRelative = true,
                            RelationToPatient = r.RelationToPatient,
                            RelatedToPatientId = newPatient.Id,
                            ProfileProgress = r.ProfileProgress,
                            IsActive = r.IsActive == 1,
                            UserId = userId,
                            CreatedDate = DateTime.Now,
                            CreatedById = userId
                        });
                    }

                    _dbContext.Smartrx_PatientProfile.AddRange(relatives);
                    await _dbContext.SaveChangesAsync(cancellationToken);
                }

                // Return the created patient with relatives
                return await GetPatientProfileWithRelativesById(newPatient.Id, cancellationToken);
            }
            catch (Exception ex)
            {
                throw new Exception("Failed to create patient profile: " + ex.Message);
            }
        }

        private async Task<string> GeneratePatientCodeAsync()
        {
            try
            {
                // Get the last patient code that starts with 'P'
                var lastPatient = await _dbContext.Smartrx_PatientProfile
                    .Where(p => p.PatientCode.StartsWith("P") && p.PatientCode.Length >= 2)
                    .OrderByDescending(p => p.PatientCode)
                    .FirstOrDefaultAsync();

                int nextCode = 1;
                if (lastPatient != null && !string.IsNullOrEmpty(lastPatient.PatientCode))
                {
                    // Extract the numeric part after 'P'
                    var numericPart = lastPatient.PatientCode.Substring(1);
                    if (int.TryParse(numericPart, out int lastCodeNumber))
                    {
                        nextCode = lastCodeNumber + 1;
                    }
                }

                // Format as P followed by 9 digits (total 10 characters)
                return "P" + nextCode.ToString().PadLeft(9, '0');
            }
            catch (Exception ex)
            {
                throw new Exception("Failed to generate patient code: " + ex.Message);
            }
        }
    }
}
