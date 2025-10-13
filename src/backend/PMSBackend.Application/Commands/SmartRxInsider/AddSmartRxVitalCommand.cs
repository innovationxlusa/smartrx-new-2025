using MediatR;
using Microsoft.AspNetCore.Http;
using PMSBackend.Application.CommonServices;
using PMSBackend.Application.DTOs;
using PMSBackend.Domain.Entities;
using PMSBackend.Domain.Repositories;

namespace PMSBackend.Application.Commands.SmartRxInsider
{
    public class AddSmartRxVitalCommand : IRequest<SmartRxVitalDTO>
    {
        public long SmartRxMasterId { get; set; }
        public long PrescriptionId { get; set; }
        //public string VitalName { get; set; }
        public long VitalId { get; set; }
        public decimal VitalValue { get; set; }
        public long LoginUserId { get; set; }
    }

    public class CreateVitalCommandHandler : IRequestHandler<AddSmartRxVitalCommand, SmartRxVitalDTO>
    {
        // private readonly ILogger<InsertPrescriptionUploadCommandHandler> _logger;
        private readonly ISmartRxVitalRepository _smartRxVitalRepository;
        public CreateVitalCommandHandler(ISmartRxVitalRepository smartRxVitalRepository)
        {
            _smartRxVitalRepository = smartRxVitalRepository;
        }

        public async Task<SmartRxVitalDTO> Handle(AddSmartRxVitalCommand request, CancellationToken cancellationtoken)
        {
            try
            {
                var responseResult = new SmartRxVitalDTO();

                var existingVital = await _smartRxVitalRepository.IsExistsVital(request.SmartRxMasterId, request.PrescriptionId, request.VitalId);

                if (existingVital is not null)
                {
                    responseResult.ApiResponseResult = new ApiResponseResult
                    {
                        Data = null,
                        StatusCode = StatusCodes.Status409Conflict,
                        Status = "Failed",
                        Message = "This vital is already added in this prescription."
                    };
                    return responseResult;
                }

                SmartRx_PatientVitalsEntity entity = new()
                {
                    SmartRxMasterId = request.SmartRxMasterId,
                    PrescriptionId = request.PrescriptionId,
                    VitalId = request.VitalId,
                    VitalValue = request.VitalValue,
                    VitalStatus = string.Empty,
                    CreatedDate = DateTime.Now,
                    CreatedById = request.LoginUserId
                };
                var result = await _smartRxVitalRepository.AddAsync(entity);
                await Task.CompletedTask;

                SmartRxVitalDTO vitalDto = new()
                {
                    Id = result.Id,
                    SmartRxMasterId = request.SmartRxMasterId,
                    PrescriptionId = request.PrescriptionId,
                    VitalId = request.VitalId,
                    VitalValue = request.VitalValue,
                    VitalStatus = null,
                    ApiResponseResult = null
                };
                return vitalDto;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
