using MediatR;
using Microsoft.AspNetCore.Mvc;
using PMSBackend.Application.CommonServices;
using PMSBackend.Application.DTOs;
using PMSBackend.Application.Queries.DoctorProfile;
using PMSBackend.Domain.SharedContract;

namespace PMSBackend.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DoctorController : ControllerBase
    {
        public readonly IMediator _mediator;

        public DoctorController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpPost("GetDoctorDetialsById")]
        [ProducesDefaultResponseType(typeof(DoctorProfileDTO))]
        public async Task<IActionResult> GetPatientProfileDetialsAsync([FromBody] GetDoctorProfileByIdQuery query)
        {
            try
            {

                var result = await _mediator.Send(query);
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
                        Message = "Doctor profile details found!"
                    });
                }

                return StatusCode(StatusCodes.Status417ExpectationFailed, new ApiResponseResult
                {
                    Data = null,
                    StatusCode = StatusCodes.Status417ExpectationFailed,
                    Status = "Failed",
                    Message = "Data not found. Please contact with the system administrator.",
                    StackTrace = null
                });

            }
            catch (Exception ex)
            {
                throw;
            }
        }

        [HttpPost("GetDoctorProfilesByUserId")]
        [ProducesDefaultResponseType(typeof(PaginatedResult<DoctorProfileListItemDTO>))]
        public async Task<IActionResult> GetDoctorProfilesByUserIdAsync([FromBody] GetDoctorProfilesByUserIdQuery query)
        {
            try
            {
                var result = await _mediator.Send(query);
                if (result is not null)
                {
                    return StatusCode(StatusCodes.Status200OK, new ApiResponseResult
                    {
                        Data = result,
                        StatusCode = StatusCodes.Status200OK,
                        Status = "Success",
                        Message = "Doctor profiles found!"
                    });
                }

                return StatusCode(StatusCodes.Status417ExpectationFailed, new ApiResponseResult
                {
                    Data = null,
                    StatusCode = StatusCodes.Status417ExpectationFailed,
                    Status = "Failed",
                    Message = "Data not found. Please contact with the system administrator.",
                    StackTrace = null
                });
            }
            catch (Exception)
            {
                throw;
            }
        }


    }
}

