using MediatR;
using Microsoft.AspNetCore.Http;
using PMSBackend.Application.CommonServices;
using PMSBackend.Application.DTOs;
using PMSBackend.Domain.Repositories;
using PMSBackend.Domain.SharedContract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace PMSBackend.Application.Commands.SmartRxInsider
{
    public class ChangeSmartRxDoctorReviewCommand:IRequest<SmartRxDoctorDTO>
    {
        public long SmartRxMasterId { get; set; }
        public long PrescriptionId { get; set; }
        public long DoctorId { get; set; }
        //Time
        public int? TravelTimeMinute { get; set; }
        public int? WaitingTimeHour { get; set; }
        public int? WaitingTimeMinute { get; set; }
        public int? DoctorConsultingDuration { get; set; }// Doctor visit time
        //Cost
        public decimal? FeeCharged { get; set; }//doctor fee
        public long? FeeChargedMeasurementUnitId { get; set; } = 17;
        public string? FeeChargedMeasurementUnit { get; set; } = "৳";
        public decimal? TransportCost { get; set; }
        public decimal? OtherCost { get; set; }


        //Rating
        public decimal? Rating { get; set; }        
        public string Comments { get; set; }
        public long LoginUserId { get; set; }
    }
    public class ChangeSmartRxDoctorReviewCommandHandler : IRequestHandler<ChangeSmartRxDoctorReviewCommand, SmartRxDoctorDTO>
    {
        // private readonly ILogger<InsertPrescriptionUploadCommandHandler> _logger;
        private readonly ISmartRxInsiderRepository _smartRxRepository;
        public ChangeSmartRxDoctorReviewCommandHandler(ISmartRxInsiderRepository smartRxRepository)
        {
            _smartRxRepository = smartRxRepository;
        }

        public async Task<SmartRxDoctorDTO?> Handle(ChangeSmartRxDoctorReviewCommand request, CancellationToken cancellationtoken)
        {
            try
            {
                SmartRxDoctorDTO responseResult = new SmartRxDoctorDTO();               
                var smartrxDoctors = await _smartRxRepository.GetPatientDoctorsListBySmartRxId(request.SmartRxMasterId, request.PrescriptionId,cancellationtoken);
                if(smartrxDoctors is null || !smartrxDoctors.Any())
                {
                    responseResult.ApiResponseResult = new ApiResponseResult
                    {
                        Data = null,
                        StatusCode = StatusCodes.Status404NotFound,
                        Status = "Failed",
                        Message = "Doctor not found for this SmartRx.",
                    };
                    return responseResult;
                }
                var smartrxDoctor = await _smartRxRepository.UpdateSmartRxDoctorReviewByUser(request.SmartRxMasterId, request.PrescriptionId, request.DoctorId, 
                   request.TravelTimeMinute, request.WaitingTimeHour, request.WaitingTimeMinute, request.DoctorConsultingDuration, request.FeeCharged, request.FeeChargedMeasurementUnitId, 
                   request.TransportCost, request.OtherCost, request.Rating, request.Comments,request.LoginUserId, cancellationtoken);
                if (smartrxDoctor == null)
                {
                    responseResult.ApiResponseResult = new ApiResponseResult
                    {
                        Data = null,
                        StatusCode = StatusCodes.Status404NotFound,
                        Status = "Failed",
                        Message = "Doctor review not updated.",
                    };
                    return responseResult;
                }               

                responseResult.SmartRxMasterId = smartrxDoctor.SmartRxMasterId;
                responseResult.PrescriptionId = smartrxDoctor.PrescriptionId;
                responseResult.DoctorId = smartrxDoctor.DoctorId;

                responseResult.TravelTimeMinute = smartrxDoctor.TravelTimeMinute;
                responseResult.ChamberWaitTimeMinute = smartrxDoctor.ChamberWaitTimeMinute;
                responseResult.ChamberWaitTimeHour = smartrxDoctor.ChamberWaitTimeHour;
                responseResult.ConsultingDurationInMinutes = smartrxDoctor.ConsultingDurationInMinutes;

                responseResult.ChamberFee = smartrxDoctor.ChamberFee;
                responseResult.ChamberFeeMeasurementUnit = smartrxDoctor.ChamberFeeMeasurementUnit;
                responseResult.TransportFee = smartrxDoctor.TransportFee;
                responseResult.OtherExpense = smartrxDoctor.OtherExpense;
               
                responseResult.DoctorRating = smartrxDoctor.DoctorRating;
                responseResult.Comments = smartrxDoctor.Comments;

                responseResult.PatientDoctor = new DoctorProfileDTO()
                {
                    DoctorId = smartrxDoctor.DoctorId,
                    DoctorFirstName = smartrxDoctor.PatientDoctor.DoctorFirstName,
                    DoctorLastName = smartrxDoctor.PatientDoctor.DoctorLastName,
                    ProfilePhotoName = smartrxDoctor.PatientDoctor.ProfilePhotoName,
                    ProfilePhotoPath = smartrxDoctor.PatientDoctor.ProfilePhotoPath,
                    DoctorSpecializedArea = smartrxDoctor.PatientDoctor.DoctorSpecializedArea,
                    DoctorBMDCRegNo = smartrxDoctor.PatientDoctor.DoctorBMDCRegNo,
                    DoctorCode = smartrxDoctor.PatientDoctor.DoctorCode,
                };
                responseResult.DoctorEducations = smartrxDoctor.DoctorEducations!.Select(e => new EducationDTO()
                {
                    EducationCode = e.EducationCode,
                    EducationDegreeName = e.EducationDegreeName,
                    EducationDescription = e.EducationDescription,
                    EducationId = e.EducationId,
                    EducationInstitutionName = e.EducationInstitutionName
                }).ToList();
                responseResult.Chambers = smartrxDoctor.DoctorChambers.Select(c => new SmartRxDoctorChamberDTO()
                {
                    ChamberName = c.ChamberName,
                    ChamberAddress = c.ChamberAddress,
                    ChamberGoogleAddress = c.ChamberGoogleAddress,
                    ChamberCityName = c.ChamberCityName,
                    ChamberCloseDay = c.ChamberCloseDay,
                    ChamberDescription = c.ChamberDescription,
                    ChamberDoctorBookingMobileNos = c.ChamberDoctorBookingMobileNos,
                    ChamberEmail = c.ChamberEmail,
                    ChamberEndTime = c.ChamberEndTime,
                    ChamberGoogleRating = c.ChamberGoogleRating,
                    ChamberHelpline = c.ChamberHelpline,
                    ChamberOpenDay = c.ChamberOpenDay,
                    ChamberOtherDoctorsId = c.ChamberOtherDoctorsId,
                    ChamberPostalCode = c.ChamberPostalCode,
                    ChamberStartTime = c.ChamberStartTime,
                    ChamberVisitingHour = c.ChamberVisitingHour,
                    DepartmentName = c.DepartmentName,
                    DepartmentSectionName = c.DepartmentSectionName,
                    DoctorDesignaitonInChamber = c.DoctorDesignaitonInChamber,
                    DoctorId = c.DoctorId,
                    DoctorSpecialization = c.DoctorSpecialization,
                    HospitalName = c.HospitalName,
                    IsMainChamber = c.IsMainChamber,
                    VisitingHour = c.VisitingHour,
                    Remarks = c.Remarks,
                    IsActive = c.IsActive,
                }).ToList();


                responseResult.ApiResponseResult = null;
                await Task.CompletedTask;

                return responseResult;
            }
            catch (Exception)
            {
                throw;
            }
        }

    }
}
