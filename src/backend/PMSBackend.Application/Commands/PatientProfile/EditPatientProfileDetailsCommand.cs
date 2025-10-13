using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using PMSBackend.Application.Commands.PrescriptionUpload;
using PMSBackend.Application.CommonServices;
using PMSBackend.Application.DTOs;
using PMSBackend.Domain.Repositories;
using PMSBackend.Domain.SharedContract;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;

namespace PMSBackend.Application.Commands.PatientProfile
{
    public class EditPatientProfileDetailsCommand : IRequest<PatientWithRelativesDTO>
    {       
        public long PatientId { get; set; }
        public PatientWithRelativesDTO? PatientDetails { get; set; }        
        public long LoginUserId { get; set; }

    }

    public class EditPatientProfileDetailsCommandHandler : IRequestHandler<EditPatientProfileDetailsCommand, PatientWithRelativesDTO>
    {

        private readonly IPatientProfileRepository _repository;
        private readonly ILogger<EditForSmartRxRequestCommand> _logger;
        public EditPatientProfileDetailsCommandHandler(IPatientProfileRepository repository, ILogger<EditForSmartRxRequestCommand> logger)
        {
            _repository = repository;
            _logger = logger;
        }

        public async Task<PatientWithRelativesDTO> Handle(EditPatientProfileDetailsCommand request, CancellationToken cancellationtoken)
        {
            try
            {
                var responseResult = new PatientWithRelativesDTO();

                bool isExistsPatient = await _repository.IsExistsPatientProfileDetails(request.PatientId);
                if(!isExistsPatient)
                {
                    responseResult.ApiResponseResult = new ApiResponseResult
                    {
                        Data = null,
                        StatusCode = StatusCodes.Status400BadRequest,
                        Status = "Failed",
                        Message = "Patient not found"
                    };
                    return responseResult;
                }



                PatientWithRelativesContract pt = new PatientWithRelativesContract();
                pt.Id = request.PatientDetails.Id;
                pt.PatientCode = request.PatientDetails.PatientCode;
                pt.FirstName = request.PatientDetails.FirstName;
                pt.LastName = request.PatientDetails.LastName;
                pt.NickName = request.PatientDetails.NickName;
                pt.Age = request.PatientDetails.Age;
                pt.AgeYear = request.PatientDetails.AgeYear;
                pt.AgeMonth = request.PatientDetails.AgeMonth;
                pt.Gender = request.PatientDetails.Gender;
                pt.DateOfBirth = request.PatientDetails.DateOfBirth;
                pt.BloodGroup = request.PatientDetails.BloodGroup;
                pt.Height = request.PatientDetails.Height;
                pt.HeightFeet= request.PatientDetails.HeightFeet;
                pt.HeightInches = request.PatientDetails.HeightInches;
                pt.HeightMeasurementUnit = request.PatientDetails.HeightMeasurementUnit;

                pt.Weight = request.PatientDetails.Weight;
                pt.WeightMeasurementUnit = request.PatientDetails.WeightMeasurementUnit;

                // Default to whatever came from the client DTO first
                pt.ProfilePhotoName = request.PatientDetails.ProfilePhotoName;
                pt.ProfilePhotoPath = request.PatientDetails.ProfilePhotoPath;

                // If a new file was uploaded, override with generated name/path
                if (request.PatientDetails.ProfilePhoto != null && request.PatientDetails.ProfilePhoto.Length > 0)
                {
                    pt.ProfilePhotoName = $"PatientProfilePhoto_{request.PatientDetails.PatientCode}_thumbnail.jpg";
                    pt.ProfilePhotoPath = $"photos\\PatientProfilePhoto_{request.PatientDetails.PatientCode}_thumbnail.jpg";
                }

                pt.PhoneNumber = request.PatientDetails.PhoneNumber;
                pt.Email = request.PatientDetails.Email;
                pt.Address = request.PatientDetails.Address;
                pt.PoliceStationId = request.PatientDetails.PoliceStationId;

                pt.CityId = request.PatientDetails.CityId;
                pt.PostalCode = request.PatientDetails.PostalCode;
                pt.EmergencyContact = request.PatientDetails.EmergencyContact;
                pt.MaritalStatus = request.PatientDetails.MaritalStatus;
                pt.Profession = request.PatientDetails.Profession;
                pt.IsExistingPatient = request.PatientDetails.IsExistingPatient??false;
                pt.ExistingPatientId = request.PatientDetails.ExistingPatientId;
                pt.ProfileProgress = request.PatientDetails.ProfileProgress;

                if(request.PatientDetails.Relatives is not null)
                {
                    pt.Relatives = request!.PatientDetails!.Relatives!.Select(r => new RelativeContract()
                    {
                        Id = r.Id,
                        PatientCode = r.PatientCode ?? string.Empty,
                        FirstName = r.FirstName ?? string.Empty,
                        LastName = r.LastName ?? string.Empty,
                        NickName = r.NickName,
                        Age = r.Age,
                        AgeYear = r.AgeYear,
                        AgeMonth = r.AgeMonth,
                        DateOfBirth = r.DateOfBirth,
                        Gender = r.Gender ?? 0,
                        BloodGroup = r.BloodGroup,
                        Height = r.Height ?? string.Empty,
                        PhoneNumber = r.PhoneNumber ?? string.Empty,
                        Email = r.Email ?? string.Empty,
                        ProfilePhotoName = r.ProfilePhotoName,
                        ProfilePhotoPath = r.ProfilePhotoPath,
                        Address = r.Address,
                        PoliceStationId = r.PoliceStationId,
                        CityId = r.CityId,
                        PostalCode = r.PostalCode,
                        EmergencyContact = r.EmergencyContact,
                        MaritalStatus = r.MaritalStatus,
                        Profession = r.Profession,
                        IsExistingPatient = r.IsExistingPatient ?? false,
                        ExistingPatientId = r.ExistingPatientId,
                        RelationToPatient = r.RelationToPatient,
                        RelatedToPatientId = r.RelatedToPatientId,
                        ProfileProgress = r.ProfileProgress,
                        IsRelative = true,
                        IsActive = r.IsActive ?? 1
                    }).ToList();
                }
                
                
                var patientUpdatedInfo = await _repository.EditPatientDetailsAsync(request.PatientId, request.LoginUserId, pt, cancellationtoken);

                
                await Task.CompletedTask;

                responseResult.Id = patientUpdatedInfo.Id ?? 0;
                responseResult.PatientCode = patientUpdatedInfo.PatientCode;
                responseResult.FirstName = patientUpdatedInfo.FirstName;
                responseResult.LastName = patientUpdatedInfo.LastName;
                responseResult.NickName = patientUpdatedInfo.NickName;
                responseResult.Age = patientUpdatedInfo.Age;
                responseResult.AgeYear = patientUpdatedInfo.AgeYear;
                responseResult.AgeMonth = patientUpdatedInfo.AgeMonth;
                responseResult.Gender = patientUpdatedInfo.Gender ?? 0;
                responseResult.DateOfBirth = patientUpdatedInfo.DateOfBirth;
                responseResult.BloodGroup = patientUpdatedInfo.BloodGroup;
                responseResult.Height = patientUpdatedInfo.Height;
                responseResult.HeightFeet = patientUpdatedInfo.HeightFeet ?? 0;
                responseResult.HeightInches = patientUpdatedInfo.HeightInches ?? 0;
                responseResult.HeightMeasurementUnit = patientUpdatedInfo.HeightMeasurementUnit;
                responseResult.HeightMeasurementUnitId = patientUpdatedInfo.HeightMeasurementUnitId;
                responseResult.Weight = patientUpdatedInfo.Weight;
                responseResult.WeightMeasurementUnit= patientUpdatedInfo.WeightMeasurementUnit;
                responseResult.WeightMeasurementUnitId = patientUpdatedInfo.WeightMeasurementUnitId;
                responseResult.PhoneNumber = patientUpdatedInfo.PhoneNumber;
                responseResult.Email = patientUpdatedInfo.Email;
                responseResult.Profession = patientUpdatedInfo.Profession;
                responseResult.ProfilePhotoName = patientUpdatedInfo.ProfilePhotoName;
                responseResult.ProfilePhotoPath = patientUpdatedInfo.ProfilePhotoPath;
                responseResult.Address = patientUpdatedInfo.Address;
                responseResult.PoliceStationId = patientUpdatedInfo.PoliceStationId;

                responseResult.CityId = patientUpdatedInfo.CityId;
                responseResult.PostalCode = patientUpdatedInfo.PostalCode;
                responseResult.EmergencyContact = patientUpdatedInfo.EmergencyContact;
                responseResult.MaritalStatus = patientUpdatedInfo.MaritalStatus;
                responseResult.Profession = patientUpdatedInfo.Profession;
                responseResult.IsExistingPatient = patientUpdatedInfo.IsExistingPatient;
                responseResult.ExistingPatientId = patientUpdatedInfo.ExistingPatientId;
                responseResult.ProfileProgress = patientUpdatedInfo.ProfileProgress??0;

                if(patientUpdatedInfo.Relatives is not null)
                {
                    responseResult.RelativesDropdown = new List<PatientDropdown>();

                    foreach (var relative in patientUpdatedInfo.Relatives)
                    {
                        var rel = new PatientDropdown()
                        {
                            PatientId = relative.Id,
                            PatientName=relative.FirstName+" "+relative.LastName+" "+relative.NickName
                        };
                        responseResult.RelativesDropdown.Add(rel);
                    }
                    responseResult.Relatives = patientUpdatedInfo.Relatives!.Select(p => new RelativeDTO()
                    {
                        Id = p.Id,
                        PatientCode = p.PatientCode,
                        FirstName = p.FirstName,
                        LastName = p.LastName,
                        NickName = p.NickName,
                        Age = p.Age,
                        AgeYear = p.AgeYear,
                        AgeMonth = p.AgeMonth,
                        Gender = p.Gender,
                        DateOfBirth = p.DateOfBirth,
                        BloodGroup = p.BloodGroup,
                        Height = p.Height,
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
                        IsRelative = p.IsRelative,
                        RelationToPatient = p.RelationToPatient,
                        ProfileProgress = p.ProfileProgress,
                        IsActive = p.IsActive
                    }).ToList();
                }
               
                return responseResult;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}


