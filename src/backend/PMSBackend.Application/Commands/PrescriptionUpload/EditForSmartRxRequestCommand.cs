using MediatR;
using Microsoft.Extensions.Logging;
using PMSBackend.Application.DTOs;
using PMSBackend.Domain.Repositories;

namespace PMSBackend.Application.Commands.PrescriptionUpload
{
    public class EditForSmartRxRequestCommand : IRequest<PrescriptionUploadDTO>
    {
        public long PrescriptionId { get; set; }
        public long UpdatedBy { get; set; }
    }
    public class UpdateForSmartRxRequestCommandHandler : IRequestHandler<EditForSmartRxRequestCommand, PrescriptionUploadDTO>
    {

        private readonly IPrescriptionUploadRepository _repository;
        private readonly ILogger<EditForSmartRxRequestCommand> _logger;
        public UpdateForSmartRxRequestCommandHandler(IPrescriptionUploadRepository repository, ILogger<EditForSmartRxRequestCommand> logger)
        {
            _repository = repository;
            _logger = logger;
        }

        public async Task<PrescriptionUploadDTO> Handle(EditForSmartRxRequestCommand request, CancellationToken cancellationtoken)
        {
            try
            {
                var prescriptionInfo = await _repository.GetDetailsByIdAsync(request.PrescriptionId);
                prescriptionInfo!.IsSmartRxRequested = true;
                prescriptionInfo.ModifiedById = request.UpdatedBy;
                prescriptionInfo.ModifiedDate = DateTime.Now;

                await _repository.UpdateAsync(prescriptionInfo);
                //var sequenceResult = await _repository.GenerateFileSequenceAsync(request.UniqueFileId);
                _logger.LogInformation($"new prescription uploaded. file id: {request.PrescriptionId}");

                await Task.CompletedTask;
                PrescriptionUploadDTO patientDto = new PrescriptionUploadDTO()
                {
                    Id = prescriptionInfo.Id,
                    PrescriptionCode = prescriptionInfo.PrescriptionCode,
                    FilePath = prescriptionInfo.FilePath,
                    FileName = prescriptionInfo.FileName,
                    IsExistingPatient = false,
                    PatientId = prescriptionInfo.PatientId,
                    HasExistingRelative = false,
                    RelativePatientIds = "",
                    IsSmartRxRequested = prescriptionInfo.IsSmartRxRequested
                };
                return patientDto;
            }
            catch (Exception)
            {
                throw;
            }

        }


    }

}

