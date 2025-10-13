using MediatR;
using PMSBackend.Domain.Repositories;

namespace PMSBackend.Application.Commands.PrescriptionUpload
{
    public class DeletePrescriptionCommand : IRequest<bool>
    {
        public long PrescriptionId { get; set; }
    }
    public class DeletePrescriptionCommandHandler : IRequestHandler<DeletePrescriptionCommand, bool>
    {

        private readonly IPrescriptionUploadRepository _repository;
        // private readonly ILogger<UpdateForSmartRxRequestCommand> _logger;
        public DeletePrescriptionCommandHandler(IPrescriptionUploadRepository repository)
        {
            _repository = repository;
            // _logger = logger;
        }

        public async Task<bool> Handle(DeletePrescriptionCommand request, CancellationToken cancellationtoken)
        {
            try
            {
                await _repository.DeleteAsync(request.PrescriptionId);
                await Task.CompletedTask;
                return true;
            }
            catch (Exception)
            {
                throw;
            }
        }


    }

}