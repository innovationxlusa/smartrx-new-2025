using MediatR;
using Microsoft.AspNetCore.Mvc;
using PMSBackend.Application.CommonServices;
using PMSBackend.Application.DTOs;
using PMSBackend.Application.Queries.Dashboard;

namespace PMSBackend.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DashboardController : ControllerBase
    {
        private readonly IMediator _mediator;

        public DashboardController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpGet("dashboard-summary")]
        [ProducesDefaultResponseType(typeof(DashboardSummaryDTO))]
        public async Task<IActionResult> GetDashboardSummary([FromQuery] long userId)
        {
            var result = await _mediator.Send(new GetDashboardSummaryQuery { UserId = userId });
            return StatusCode(StatusCodes.Status200OK, new ApiResponseResult
            {
                Data = result,
                StatusCode = StatusCodes.Status200OK,
                Status = "Success",
                Message = "Dashboard summary retrieved"
            });
        }
    }
}

