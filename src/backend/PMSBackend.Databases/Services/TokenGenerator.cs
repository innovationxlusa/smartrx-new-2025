using Microsoft.IdentityModel.Tokens;
using PMSBackend.Application.CommonServices.Interfaces;
using PMSBackend.Domain.Entities;
using PMSBackend.Domain.Repositories;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace PMSBackend.Databases.Services
{
    public class TokenGenerator : ITokenGenerator
    {
        private readonly IUserRepository _userRepository;
        private readonly IUserWiseFolderRepository _userWiseFolderRepository;

        public TokenGenerator(IUserRepository userRepository, IUserWiseFolderRepository userWiseFolderRepository)
        {
            _userRepository = userRepository;
            _userWiseFolderRepository = userWiseFolderRepository;
        }

        public async Task<string> GenerateJWTToken(long userId)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(JwtConfig.Settings.SecretKey));
            var signingCredentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);
            var user = await _userRepository.GetDetailsByIdAsync(userId);
            var primaryFolderInfo = await _userWiseFolderRepository.GetPrimaryDetailsByIdAsync(user.Id);
            var claims = new List<Claim>()
            {
                new Claim(JwtRegisteredClaimNames.Sub, "AUTHENTICATION"),
                new Claim(JwtRegisteredClaimNames.Jti, userId.ToString()),
                new Claim(ClaimTypes.Name, user!.UserName),
                new Claim("FirstName", user!.FirstName),
                new Claim("LastName", user.LastName),
                new Claim("PrimaryFolderId", primaryFolderInfo.Id.ToString()),
                new Claim("PrimaryFolderHeirarchy", primaryFolderInfo.FolderHierarchy.ToString()),
                new Claim("PrimaryFolderParentFolderId", primaryFolderInfo.ParentFolderId.ToString()),
            };
            claims.AddRange(user.UserRoles.Select(role => new Claim(ClaimTypes.Role, role.ToString())));

            var token = new JwtSecurityToken(
                issuer: JwtConfig.Settings.Issuer,
                audience: JwtConfig.Settings.Audience,
                claims: claims,
                expires: DateTime.Now.AddMinutes(Convert.ToDouble(JwtConfig.Settings.ExpiryMinutes)),
                signingCredentials: signingCredentials
           );

            var encodedToken = new JwtSecurityTokenHandler().WriteToken(token);
            return encodedToken;
        }
    }
}
