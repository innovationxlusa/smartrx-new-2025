using Microsoft.EntityFrameworkCore;
using PMSBackend.Databases.Data;
using PMSBackend.Domain.Entities;
using PMSBackend.Domain.Repositories;

namespace PMSBackend.Databases.Repositories
{
    public class PrescriptionUploadRepository : IPrescriptionUploadRepository
    {
        private readonly PMSDbContext _dbContext;
        private readonly IBaseRepository<Prescription_UploadEntity> _prescriptionRepository;


        public PrescriptionUploadRepository(PMSDbContext context)
        {
            this._dbContext = context;
            _prescriptionRepository = new BaseRepository<Prescription_UploadEntity>(_dbContext);
        }
        /// <summary>
        /// Insert, update, delete, query of file upload/scan/capture
        /// </summary>
        /// <returns></returns>
        public async Task<Prescription_UploadEntity> AddAsync(Prescription_UploadEntity entity)
        {
            try
            {
                //entity.CreatedById = entity.UserId;
                //entity.CreatedDate = DateTime.Now;
                await _prescriptionRepository.AddAsync(entity);
                return entity;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        public async Task<Prescription_UploadEntity> UpdateAsync(Prescription_UploadEntity entity)
        {
            try
            {
                var result = await _prescriptionRepository.UpdateAsync(entity);
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public async Task DeleteAsync(long id)
        {
            try
            {
                await _prescriptionRepository.DeleteAsync(id);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public async Task<IEnumerable<Prescription_UploadEntity>> GetAllAsync()
        {
            try
            {
                return await _prescriptionRepository.GetAllAsync();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public async Task<Prescription_UploadEntity>? GetDetailsByIdAsync(long id)
        {
            try
            {
                var result = await _dbContext.Prescription_UploadedPrescription.FirstOrDefaultAsync(c => c.Id == id);
                return result ?? new Prescription_UploadEntity();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        public async Task<IQueryable<Prescription_UploadEntity>> GetByFilter()
        {
            throw new NotImplementedException();
        }


        /// <summary>
        /// Insert, update, delete, query of file upload sequence
        /// </summary>
        /// <returns></returns>
        public async Task<Prescription_UploadEntity> GetLastSavedPrescriptionCode()
        {
            try
            {
                var result = await _dbContext.Prescription_UploadedPrescription.OrderByDescending(data => data.PrescriptionCode).FirstOrDefaultAsync();
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }




    }
}
