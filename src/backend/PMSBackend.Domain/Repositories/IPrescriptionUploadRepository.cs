using PMSBackend.Domain.Entities;

namespace PMSBackend.Domain.Repositories
{
    public interface IPrescriptionUploadRepository : IBaseRepository<Prescription_UploadEntity>
    {
        Task<IQueryable<Prescription_UploadEntity>> GetByFilter();
        Task<Prescription_UploadEntity> GetLastSavedPrescriptionCode();
        //Task<PrescriptionUploadEntity> GenerateFileSequenceAsync(string uniqueFileId);
    }
}
