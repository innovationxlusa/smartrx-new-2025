using Microsoft.EntityFrameworkCore;
using PMSBackend.Databases.Data;
using PMSBackend.Domain.Repositories;

namespace PMSBackend.Databases.Repositories
{
    public class BaseRepository<T> : IBaseRepository<T> where T : class
    {
        protected readonly PMSDbContext _context;
        private DbSet<T> table = null;
        public BaseRepository(PMSDbContext context)
        {
            try
            {
                _context = context;
                table = _context.Set<T>();
            }
            catch (Exception)
            {

                throw;
            }
        }

        // Insert
        public async Task<T> AddAsync(T entity)
        {
            try
            {
                await table.AddAsync(entity);
                await _context.SaveChangesAsync();
                _context.Entry(entity).Reload();
                return entity;
            }
            catch (Exception)
            {

                throw;
            }
        }

        // Update
        public async Task<T> UpdateAsync(T entity)
        {
            try
            {
                _context.Entry(entity).State = EntityState.Modified;
                await _context.SaveChangesAsync();
                _context.Entry(entity).Reload();
                return entity;
            }
            catch (Exception)
            {

                throw;
            }
        }

        // Query       
        public async Task<IEnumerable<T>> GetAllAsync()
        {
            try
            {
                var result = table.ToListAsync();
                return await result;
            }
            catch (Exception)
            {

                throw;
            }
        }
        public async Task<T> GetDetailsByIdAsync(long id)
        {
            try
            {
                var result = table.FindAsync(id);
                return await result;
            }
            catch (Exception)
            {

                throw;
            }
        }

        // Delete
        public async Task DeleteAsync(long id)
        {
            try
            {
                var entity = await table.FindAsync(id);
                if (entity != null)
                {
                    table.Remove(entity);
                    await _context.SaveChangesAsync();
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public void Dispose()
        {
            try
            {
                _context.Dispose();
            }
            catch (Exception)
            {

                throw;
            }

        }


    }
}