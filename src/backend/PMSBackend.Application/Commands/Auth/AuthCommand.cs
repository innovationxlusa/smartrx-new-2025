using MediatR;
using Microsoft.AspNetCore.Http;
using PMSBackend.Application.CommonServices;
using PMSBackend.Application.CommonServices.Interfaces;
using PMSBackend.Application.DTOs;
using PMSBackend.Domain.Entities;
using PMSBackend.Domain.Repositories;

namespace PMSBackend.Application.Commands.Auth
{
    public class AuthCommand : IRequest<LoginDTO>
    {
        public string UserName { get; set; }
        public int AuthType { get; set; }
        public string? Password { get; set; } = default!;
    }


    public class AuthCommandHandler : IRequestHandler<AuthCommand, LoginDTO>
    {
        private readonly ITokenGenerator _tokenGenerator;
        //private readonly IIdentityService _identityService;
        private readonly IUserRepository _userRepository;
        private readonly IRoleRepository _roleRepository;
        private readonly IUserRoleRepository _userRoleRepository;



        public AuthCommandHandler(IUserRepository userRepository, IRoleRepository roleRepository, IUserRoleRepository userRoleRepository, ITokenGenerator tokenGenerator, IUserWiseFolderRepository userWiseFolderRepository)
        {
            _userRepository = userRepository;
            _roleRepository = roleRepository;
            _userRoleRepository = userRoleRepository;
            _tokenGenerator = tokenGenerator;

        }

        public async Task<LoginDTO> Handle(AuthCommand request, CancellationToken cancellationToken)
        {
            try
            {
                LoginDTO responseResult = new LoginDTO();
                var user = await _userRepository.SigninUserAsync(request.UserName, request.Password!);
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
                //if(request.Password is not null)
                //{
                //    var isPasswordMatched = await _userRepository.VerifyPassword(user, request.Password);
                //    if (!isPasswordMatched)
                //    {
                //        responseResult.ApiResponseResult = new ApiResponseResult
                //        {
                //            Data = null,
                //            StatusCode = StatusCodes.Status400BadRequest,
                //            Status = "Failed",
                //            Message = "Invalid Password!"
                //        };
                //        return responseResult;
                //    }
                //}

                if (user.Status.Equals((int)Status.InActive))
                {
                    responseResult.ApiResponseResult = new ApiResponseResult
                    {
                        Data = null,
                        StatusCode = StatusCodes.Status400BadRequest,
                        Status = "Failed",
                        Message = "Inactive User!"
                    };
                    return responseResult;
                }
                var userRoles = await _userRoleRepository.GetUserRolesAsync(user.Id);

                //string token = _tokenGenerator.GenerateJWTToken((userId, userName, roles));
                if (userRoles is null)
                {
                    responseResult.ApiResponseResult = new ApiResponseResult
                    {
                        Data = null,
                        StatusCode = StatusCodes.Status400BadRequest,
                        Status = "Failed",
                        Message = "User has no access!"
                    };
                    return responseResult;
                }

                var roleIds = new List<long>();
                foreach (var role in userRoles)
                {
                    roleIds.Add(role.Id);
                }
                if (request.AuthType == (int)LoginType.Mobile)
                {
                    //_otpService.GenerateOtp(request.MobileNumber);
                    //_smsService.SendSms(request.MobileNumber, $"Your OTP is {otp}");
                    // var result = await _mediator.Send(command);
                    var otp = "Abc@1234";
                }
                var userDetails = (user.UserName, user.UserCode, user.UserName, roleIds);
                var token = await _tokenGenerator.GenerateJWTToken(user.Id!);

                return new LoginDTO()
                {
                    UserId = user.Id,
                    otp = user.Password!,
                    AccessToken = token
                };
                //GenerateJWTToken(long id, (string userId, string userName, IList<long>? roles) userDetails);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
