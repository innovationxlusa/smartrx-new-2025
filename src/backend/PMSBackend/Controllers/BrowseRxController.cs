using MediatR;
using Microsoft.AspNetCore.Mvc;
using PMSBackend.Application.CommonServices;
using PMSBackend.Application.DTOs;
using PMSBackend.Application.Queries.BrowseRx;
using PMSBackend.Domain.SharedContract;

namespace PMSBackend.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BrowseRxController : ControllerBase
    {
        public readonly IMediator _mediator;

        public BrowseRxController(IMediator mediator)
        {
            _mediator = mediator;
        }


        [HttpPost("getallparentfoldersandfiles")]
        [ProducesDefaultResponseType(typeof(List<FolderNodeDTO>))]
        public async Task<IActionResult> GetBrwoseRxFilesAndFoldersListAsync([FromBody] GetBrowseRxQuery query)
        {
            try
            {
                var folderPath = Path.Combine(Directory.GetCurrentDirectory(), "Files");
                query.CurrentFolderPath = folderPath;

                var result = await _mediator.Send(query);
                if (result is not null)
                {
                    var finalResult = result.Children.Data
                                    .OrderBy(x => x.IsFolder ? 0 : 1)
                                    .ThenByDescending(x => x.CreatedDate);
                    return StatusCode(StatusCodes.Status200OK, new ApiResponseResult
                    {
                        Data = result,
                        StatusCode = StatusCodes.Status200OK,
                        Status = "Success",
                        Message = "Folder and files data found"
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
            catch (Exception ex)
            {
                throw;
            }
        }

        [HttpPost("getpatientprescriptions")]
        [ProducesDefaultResponseType(typeof(PaginatedResult<PatientPrescriptionDTO>))]
        public async Task<IActionResult> GetPatientPrescriptionsAsync([FromBody] GetPatientPrescriptionsQuery query)
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
                        Message = "Patient prescriptions data found"
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
            catch (Exception ex)
            {
                throw;
            }
        }

        [HttpPost("getpatientprescriptionsbytype")]
        [ProducesDefaultResponseType(typeof(PaginatedResult<PrescriptionDTO>))]
        public async Task<IActionResult> GetPatientPrescriptionsByTypeAsync([FromBody] PatientPrescriptionByTypeRequestDTO request)
        {
            try
            {
                var query = new GetPatientPrescriptionsByTypeQuery
                {
                    UserId = request.UserId,
                    PatientId = request.PatientId,
                    PrescriptionType = request.PrescriptionType,
                    PagingSorting = request.PagingSorting
                };

                var result = await _mediator.Send(query);
                if (result is not null)
                {
                    return StatusCode(StatusCodes.Status200OK, new ApiResponseResult
                    {
                        Data = result,
                        StatusCode = StatusCodes.Status200OK,
                        Status = "Success",
                        Message = $"Patient {request.PrescriptionType} prescriptions data found"
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
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new ApiResponseResult
                {
                    Data = null,
                    StatusCode = StatusCodes.Status500InternalServerError,
                    Status = "Error",
                    Message = ex.Message,
                    StackTrace = ex.StackTrace
                });
            }
        }
    }
}
