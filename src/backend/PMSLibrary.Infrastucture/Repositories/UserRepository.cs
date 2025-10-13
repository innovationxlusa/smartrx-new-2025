using Microsoft.EntityFrameworkCore;
using PMSBackend.Domain.Entities;
using PMSBackend.Domain.Repositories;
using PMSBackend.Infrastucture.Data;
using System.Collections.Generic;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace PMSBackend.Infrastructure.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly PMSDbContext _context;
        private readonly IBaseRepository<SmartRxUserEntity> _userRepository;
        public UserRepository(PMSDbContext context, IBaseRepository<SmartRxUserEntity> userRepository)
        {
            _context = context;
            _userRepository = userRepository;
        }

        public async Task<SmartRxUserEntity> AddAsync(SmartRxUserEntity entity)
        {
            try
            {
                var result = await _userRepository.AddAsync(entity);
                await Task.CompletedTask;
                return result;
            }
            catch (Exception)
            {

                throw;
            }           
        }

        public async Task UpdateAsync(SmartRxUserEntity entity)
        {
            try
            {
                await _userRepository.UpdateAsync(entity);
                await Task.CompletedTask;
            }
            catch (Exception)
            {

                throw;
            }          
        }

        public async Task DeleteAsync(long userId)
        {
            try
            {
                await _userRepository.DeleteAsync(userId);
                await Task.CompletedTask;
            }
            catch (Exception)
            {

                throw;
            }
          
        }

        public async Task<IEnumerable<SmartRxUserEntity>> GetAllAsync()
        {
            try
            {
                var result = await _userRepository.GetAllAsync();
                await Task.CompletedTask;
                return result;
            }
            catch (Exception)
            {

                throw;
            }        
        }

        public async Task<SmartRxUserEntity> GetDetailsByIdAsync(long userId)
        {
            try
            {
                var result = await _context.PMSUsers.FindAsync(userId);
                await Task.CompletedTask;
                return result!;
            }
            catch (Exception)
            {

                throw;
            }
          
        }
        public async Task<bool> IsUniqueUserName(string userName)
        {
            try
            {
                var result = await _userRepository.GetAllAsync();
                if (result is not null)
                {
                    return result.DistinctBy(data => data.UserName == userName).Count() > 1 ? true : false;
                }
                return false;
            }
            catch (Exception)
            {

                throw;
            }
            
        }
        public async Task<SmartRxUserEntity> SigninUserAsync(string userName, string password)
        {
            try
            {
                var result = await _context.PMSUsers.FirstOrDefaultAsync(data => data.UserName == userName && data.Password == password);
                await Task.CompletedTask;
                return result!;
            }
            catch (Exception)
            {

                throw;
            }
           
        }

        public async Task<SmartRxUserEntity> GetUserDetailsByUserCodeAsync(string userCode)
        {
            try
            {
                var result = await _context.PMSUsers.FirstOrDefaultAsync(data => data.UserCode == userCode);
                await Task.CompletedTask;
                return result!;
            }
            catch (Exception)
            {

                throw;
            }
           
        }       

        public async Task<SmartRxUserEntity> GetUserDetailsByUserNameAsync(string userName)
        {
            try
            {
                //var keyword = GetStringWithoutSpaceWithLowerCase(userName);
                var result = await _context.PMSUsers.FirstOrDefaultAsync(data => data.UserName.Trim().ToLower() == userName.Trim().ToLower());
                await Task.CompletedTask;
                return result;
            }
            catch (Exception)
            {

                throw;
            }
          
        }
        public async Task<string> GetNextProductCodeAsync()
        {            
            var lastCode = await _context.PMSUsers
                .OrderByDescending(p => p.UserCode)
                .Select(p => p.UserCode)
                .FirstOrDefaultAsync();

            // If no code found, start at 0
            int nextCode = 0;

            if (!string.IsNullOrEmpty(lastCode) && int.TryParse(lastCode, out int lastCodeNumber))
            {
                nextCode = lastCodeNumber + 1;
            }

            return nextCode.ToString().PadLeft(10,'0');
        }

      
    }
}