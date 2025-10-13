using MediatR;
using Microsoft.Extensions.Logging;
using PMSBackend.Application.DTOs;
using PMSBackend.Domain.Entities;
using PMSBackend.Domain.Repositories;



namespace PMSBackend.Application.Commands.PrescriptionUpload
{
    public class InsertPrescriptionUploadCommand : IRequest<PrescriptionUploadDTO>
    {
        //[AllowedFileExtensions(new[] { ".jpg", ".jpeg", ".png", ".gif", ".pdf" })]

        //[Required]
        //[MinLength(1, ErrorMessage = "At least one file is required.")]
        // public IList<FileUploadDto> Files { get; set; }
        public string? FileName { get; set; } = string.Empty;
        public string? FilePath { get; set; }
        public long? FileId { get; set; }
        public long? FolderId { get; set; }
        public long? UserId { get; set; }
        public string? FolderName { get; set; } = default!;
        // public string? UniqueFileId { get; set; }      
        public string? SeqNo { get; set; }
        public int? FileCount { get; set; } = 0;
        public long LoginUserId { get; set; }
        public string? FileExtension { get; set; }

    }
    public class InsertPrescriptionUploadCommandHandler : IRequestHandler<InsertPrescriptionUploadCommand, PrescriptionUploadDTO>
    {

        private readonly IPrescriptionUploadRepository _repository;
        private readonly ILogger<InsertPrescriptionUploadCommandHandler> _logger;
        private readonly IUserWiseFolderRepository _userWiseFolderRepository;
        public InsertPrescriptionUploadCommandHandler(IPrescriptionUploadRepository repository, ILogger<InsertPrescriptionUploadCommandHandler> logger, IUserWiseFolderRepository userWiseFolderRepository)
        {
            _repository = repository;
            _logger = logger;
            _userWiseFolderRepository = userWiseFolderRepository;
        }

        public async Task<PrescriptionUploadDTO> Handle(InsertPrescriptionUploadCommand request, CancellationToken cancellationtoken)
        {
            try
            {
                var folderInfo = await _userWiseFolderRepository.GetDetailsByUserIdAsync(request.LoginUserId);

                Prescription_UploadEntity entity = new Prescription_UploadEntity()
                {
                    PrescriptionCode = request.SeqNo!,
                    FilePath = request.FilePath!,
                    FileName = request.FileName!,
                    FolderId = (request.FolderId is null || request.FolderId == 0) ? folderInfo!.Id : request.FolderId.Value,
                    UserId = (request.UserId is null || request.FolderId == 0) ? folderInfo!.UserId : request.UserId.Value,
                    NumberOfFilesStoredForThisPrescription = request.FileCount ?? 0,
                    FileExtension = request.FileExtension,
                    CreatedDate = DateTime.Now,
                    CreatedById = request.LoginUserId
                };
                var result = await _repository.AddAsync(entity);
                //var sequenceResult = await _repository.GenerateFileSequenceAsync(request.UniqueFileId);
                _logger.LogInformation($"New prescription uploaded. file name: {request.FileName}");

                await Task.CompletedTask;
                PrescriptionUploadDTO patientDto = new PrescriptionUploadDTO()
                {
                    Id = result.Id,
                    PrescriptionCode = entity.PrescriptionCode,
                    FilePath = entity.FilePath,
                    FileName = entity.FileName,
                    FolderId = entity.FolderId,
                    UserId = entity.UserId,
                    IsExistingPatient = false,
                    PatientId = entity.PatientId,
                    HasExistingRelative = false,
                    RelativePatientIds = "",
                    IsSmartRxRequested = false
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
