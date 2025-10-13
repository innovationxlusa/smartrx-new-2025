using MediatR;
using Microsoft.AspNetCore.Mvc;
using PMSBackend.Application.Commands.User;
using PMSBackend.Application.Commands.User.Update;
using PMSBackend.Application.CommonServices;
using PMSBackend.Application.DTOs;
using PMSBackend.Application.Queries.User;


namespace PMSBackend.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    //[Authorize(Roles = "Admin, Management")]
    public class UserController : ControllerBase
    {
        private readonly IMediator _mediator;

        public UserController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpGet("throw")]
        public IActionResult ThrowError()
        {
            throw new Exception("Unhandled exception!");
        }

        [HttpPost("Create")]
        [ProducesDefaultResponseType(typeof(UserDetailsResponseDTO))]
        public async Task<ActionResult> CreateUser([FromBody] CreateUserCommand command)
        {
            try
            {
                var result = await _mediator.Send(command);
                if (result is not null)
                {
                    if (result.ApiResponseResult is not null)
                    {
                        return StatusCode(result.ApiResponseResult.StatusCode, result.ApiResponseResult);
                    }

                    return StatusCode(StatusCodes.Status201Created, new ApiResponseResult
                    {
                        Data = result,
                        StatusCode = StatusCodes.Status201Created,
                        Status = "Success",
                        Message = "Data saved successfully"
                    });
                }
                else
                {
                    return StatusCode(StatusCodes.Status417ExpectationFailed, new ApiResponseResult
                    {
                        Data = null,
                        StatusCode = StatusCodes.Status417ExpectationFailed,
                        Status = "Failed",
                        Message = "Data save failed. Please contact with the system administrator.",
                        StackTrace = null
                    });
                }
            }
            catch (ArgumentException ex)
            {
                return BadRequest(new ApiResponseResult
                {
                    Data = null,
                    StatusCode = 400,
                    Status = "Error",
                    Message = "An error occurred. Please contact with system administrator.",
                    StackTrace = Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT") == "Development" ? ex.StackTrace : null
                });
            }
            catch (Exception ex)
            {
                throw;
            }
        }


        [HttpGet("GetAll")]
        [ProducesDefaultResponseType(typeof(List<UserDetailsResponseDTO>))]
        public async Task<IActionResult> GetAllUserAsync()
        {
            try
            {
                var result = await _mediator.Send(new GetAllUsersDetailsQuery());
                if (result is not null)
                {
                    if (result.ApiResponseResult is not null)
                    {
                        return StatusCode(result.ApiResponseResult.StatusCode, result.ApiResponseResult);
                    }

                    return StatusCode(StatusCodes.Status201Created, new ApiResponseResult
                    {
                        Data = result,
                        StatusCode = StatusCodes.Status201Created,
                        Status = "Success",
                        Message = "Data Found!"
                    });
                }
                else
                {
                    return StatusCode(StatusCodes.Status417ExpectationFailed, new ApiResponseResult
                    {
                        Data = null,
                        StatusCode = StatusCodes.Status417ExpectationFailed,
                        Status = "Failed",
                        Message = "Data not found. Please contact with the system administrator.",
                        StackTrace = null
                    });
                }
            }
            catch (ArgumentException ex)
            {
                return BadRequest(new ApiResponseResult
                {
                    Data = null,
                    StatusCode = 400,
                    Status = "Error",
                    Message = "An error occurred. Please contact with system administrator.",
                    StackTrace = Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT") == "Development" ? ex.StackTrace : null
                });
            }
            catch (Exception ex)
            {
                throw;
            }

        }

        [HttpDelete("Delete/{userId:long}")]
        [ProducesDefaultResponseType(typeof(long))]
        public async Task<IActionResult> DeleteUser(long userId)
        {
            try
            {
                var result = await _mediator.Send(new DeleteUserCommand() { Id = userId });
                return Ok(result);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        [HttpGet("GetUserDetails/{userId:long}")]
        [ProducesDefaultResponseType(typeof(UserDetailsResponseDTO))]
        public async Task<IActionResult> GetUserDetails(long userId)
        {
            try
            {
                var result = await _mediator.Send(new GetUserDetailsQuery() { UserId = userId });
                return Ok(result);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        [HttpGet("GetUserDetails/{userName}")]
        [ProducesDefaultResponseType(typeof(UserDetailsResponseDTO))]
        public async Task<IActionResult> GetUserDetailsByUserName(string userName)
        {
            try
            {
                var result = await _mediator.Send(new GetUserDetailsByUserNameQuery() { UserName = userName });
                return Ok(result);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        [HttpPost("AssignRoles")]
        [ProducesDefaultResponseType(typeof(int))]
        public async Task<ActionResult> AssignRoles(AssignUsersRoleCommand command)
        {
            try
            {
                var result = await _mediator.Send(command);
                return Ok(result);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        [HttpPost("AssignRolesToExternalUser")]
        [ProducesDefaultResponseType(typeof(int))]
        public async Task<ActionResult> AssignRolesToExternalUser(AssignUsersRoleCommand command)
        {
            try
            {
                var result = await _mediator.Send(command);
                return Ok(result);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        //[HttpPut("EditUserRoles")]
        //[ProducesDefaultResponseType(typeof(int))]

        //public async Task<ActionResult> EditUserRoles(UpdateUserRolesCommand command)
        //{
        //    try
        //    {
        //        var result = await _mediator.Send(command);
        //        return Ok(result);
        //    }
        //    catch (Exception)
        //    {

        //        throw;
        //    }           
        //}

        [HttpGet("GetAllUserDetails")]
        [ProducesDefaultResponseType(typeof(UserDetailsResponseDTO))]
        public async Task<IActionResult> GetAllUserDetails()
        {
            try
            {
                var result = await _mediator.Send(new GetAllUsersDetailsQuery());
                return Ok(result);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        [HttpPut("EditUserProfile/{id:long}")]
        [ProducesDefaultResponseType(typeof(int))]
        public async Task<ActionResult> EditUserProfile(long id, [FromBody] EditUserProfileCommand command)
        {
            try
            {
                if (id == command.Id)
                {
                    var result = await _mediator.Send(command);
                    return Ok(result);
                }
                else
                {
                    return BadRequest();
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
