using MediatR;
using Microsoft.AspNetCore.Http;
using PMSBackend.Application.CommonServices;
using PMSBackend.Application.CommonServices.Interfaces;
using PMSBackend.Application.DTOs;
using PMSBackend.Domain.Repositories;

namespace PMSBackend.Application.Queries.Auth
{
    public class VerifyOtpRequestQuery : IRequest<AuthResponseDTO>
    {
        public long UserId { get; set; }
        public string Otp { get; set; }
        public int AuthType { get; set; }

    }
    public class VerifyOtpRequestHandler : IRequestHandler<VerifyOtpRequestQuery, AuthResponseDTO>
    {
        private readonly ITokenGenerator _tokenGenerator;
        //private readonly IIdentityService _identityService;
        private readonly IUserRepository _userRepository;
        private readonly IRoleRepository _roleRepository;
        private readonly IUserRoleRepository _userRoleRepository;
        private readonly IUserWiseFolderRepository _userWiseFolderRepository;

        public VerifyOtpRequestHandler(IUserRepository userRepository, IRoleRepository roleRepository, IUserRoleRepository userRoleRepository, ITokenGenerator tokenGenerator, IUserWiseFolderRepository userWiseFolderRepository)
        {
            _userRepository = userRepository;
            _roleRepository = roleRepository;
            _userRoleRepository = userRoleRepository;
            _tokenGenerator = tokenGenerator;
            _userWiseFolderRepository = userWiseFolderRepository;
        }

        public async Task<AuthResponseDTO> Handle(VerifyOtpRequestQuery request, CancellationToken cancellationToken)
        {
            try
            {
                var responseResult = new AuthResponseDTO();
                // code for verify otp first then below code
                var user = await _userRepository.GetDetailsByIdAsync(request.UserId);
                if (user is null)
                {
                    responseResult.ApiResponseResult = new ApiResponseResult
                    {
                        Data = null,
                        StatusCode = StatusCodes.Status400BadRequest,
                        Status = "Failed",
                        Message = "Invalid User!"
                    };
                    return responseResult;
                }
                if (request.Otp is not null)
                {
                    var isPasswordMatched = await _userRepository.VerifyPassword(user, request.Otp);
                    if (!isPasswordMatched)
                    {
                        responseResult.ApiResponseResult = new ApiResponseResult
                        {
                            Data = null,
                            StatusCode = StatusCodes.Status400BadRequest,
                            Status = "Failed",
                            Message = "Invalid Password!"
                        };
                        return responseResult;
                    }
                }
                var userPrimaryFolder = await _userWiseFolderRepository.GetPrimaryDetailsByIdAsync(request.UserId);
                var userRoles = await _userRoleRepository.GetUserRolesAsync(request.UserId);
                var userRoleIds = userRoles?.Select(id => id.Id).ToList();
                var userDetails = (request.UserId.ToString(), user?.UserCode, user?.UserName, userRoleIds);

                var token = await _tokenGenerator.GenerateJWTToken(request.UserId!);
                var isExistFile = await _userWiseFolderRepository.IsUploadedAnyFileForThisUser(request.UserId);

                //GenerateJWTToken(long id, (string userId, string userName, IList<long>? roles) userDetails);
                return new AuthResponseDTO()
                {
                    UserId = request.UserId,
                    AccessToken = token,
                    RefreshToken = token,
                    IsExistAnyFile = isExistFile,
                    userPrimaryFolder = new UserWiseFolderDTO()
                    {
                        Id = userPrimaryFolder!.Id,
                        FolderName = userPrimaryFolder.FolderName,
                        Description = userPrimaryFolder.Description ?? "",
                        FolderHierarchy = userPrimaryFolder.FolderHierarchy,
                        ParentFolderId = userPrimaryFolder.ParentFolderId,
                        PatientId = userPrimaryFolder.PatientId,
                        UserId = userPrimaryFolder.UserId,
                        CreatedDate = userPrimaryFolder.CreatedDate,
                        CreatedById = userPrimaryFolder.CreatedById,
                    }
                };
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}