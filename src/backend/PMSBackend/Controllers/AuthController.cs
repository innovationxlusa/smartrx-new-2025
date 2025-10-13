using MediatR;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using PMSBackend.Application.Commands.Auth;
using PMSBackend.Application.CommonServices;
using PMSBackend.Application.CommonServices.Exceptions;
using PMSBackend.Application.DTOs;
using PMSBackend.Application.Queries.Auth;
using PMSBackend.Domain.Entities;

namespace PMSBackend.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly IMediator _mediator;
        private readonly PasswordHasher<SmartRxUserEntity> _passwordHasher = new();
        public AuthController(IMediator mediator)
        {
            _mediator = mediator;
        }


        [HttpPost("Login")]
        [ProducesDefaultResponseType(typeof(LoginDTO))]
        public async Task<IActionResult> Login([FromBody] AuthCommand command)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return StatusCode(StatusCodes.Status200OK, new ApiResponseResult
                    {
                        Data = ModelState,
                        StatusCode = StatusCodes.Status400BadRequest,
                        Status = "Failed",
                        Message = "Model is invalid"
                    });
                    return BadRequest(ModelState); // Shows which field caused the 400 error
                }

                var result = await _mediator.Send(command);
                if (result != null)
                {
                    if (result.ApiResponseResult is not null)
                    {
                        return StatusCode(result.ApiResponseResult.StatusCode, result.ApiResponseResult);
                    }
                    return StatusCode(StatusCodes.Status200OK, new ApiResponseResult
                    {
                        Data = result,
                        StatusCode = StatusCodes.Status200OK,
                        Status = "Success",
                        Message = "User found successfully"
                    });
                }
                else
                {
                    return StatusCode(StatusCodes.Status417ExpectationFailed, new ApiResponseResult
                    {
                        Data = null,
                        StatusCode = StatusCodes.Status417ExpectationFailed,
                        Status = "Failed",
                        Message = "User not found"
                    });
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        [HttpPost("verify-otp")]
        [ProducesDefaultResponseType(typeof(AuthResponseDTO))]
        public async Task<IActionResult> VerifyOtp([FromBody] VerifyOtpRequestQuery command)
        {
            try
            {
                var returnData = new ApiResponseResult();
                var result = await _mediator.Send(command);
                //if (_otpService.VerifyOtp(request.MobileNumber, request.Otp))
                //{
                //    var token = GenerateJwtToken(request.MobileNumber);
                //    return Ok(new { token });
                //}
                //return Unauthorized(new { message = "Invalid OTP" });

                if (result is not null)
                {
                    if (result.ApiResponseResult is not null)
                    {
                        return StatusCode(result.ApiResponseResult.StatusCode, result.ApiResponseResult);
                    }
                    return StatusCode(StatusCodes.Status200OK, new ApiResponseResult
                    {
                        Data = result,
                        StatusCode = StatusCodes.Status200OK,
                        Status = "Success",
                        Message = "OTP verified successfully"
                    });
                }
                else
                {
                    returnData.Data = result!;
                    returnData.StatusCode = StatusCodes.Status417ExpectationFailed;
                    returnData.Status = "Failed";
                    returnData.Message = "Invalid OTP";
                    return Ok(returnData);
                }
            }
            catch (Exception ex)
            {
                var errorResponse = new ApiResponseResult
                {
                    StatusCode = (ex is NotFoundException notFoundEx) ? notFoundEx.ErrorCode : (ex is BadRequestException badEx) ? badEx.ErrorCode : 500,
                    Status = "Failed",
                    Message = $"OTP verification failed. An error occurred: {ex.Message}",
                    Data = new object()
                };
                return StatusCode(500, errorResponse);
            }

        }

        private string GenerateJwtToken(string mobileNumber)
        {
            // Create JWT logic (omitting actual implementation for brevity)
            return "mock-jwt-token";
        }
    }
}
