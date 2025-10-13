using MediatR;
using Microsoft.AspNetCore.Http;
using PMSBackend.Application.CommonServices;
using PMSBackend.Application.DTOs;
using PMSBackend.Domain.Entities;
using PMSBackend.Domain.Repositories;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace PMSBackend.Application.Commands.RewardBadge
{
    public class CreateRewardBadgeCommand : IRequest<RewardBadgesDTO>
    {
        public string Name { get; set; }
        public string? Description { get; set; }
        public long UserId { get; set; }
    }

    public class CreateRewardBadgeCommandHandler : IRequestHandler<CreateRewardBadgeCommand, RewardBadgesDTO>
    {
        private readonly IRewardBadgeRepository _rewardBadgeRepository;

        public CreateRewardBadgeCommandHandler(IRewardBadgeRepository rewardBadgeRepository)
        {
            _rewardBadgeRepository = rewardBadgeRepository;
        }

        public async Task<RewardBadgesDTO> Handle(CreateRewardBadgeCommand request, CancellationToken cancellationToken)
        {

            var responseResult = new RewardBadgesDTO();
            //var existingVital = await _smartRxVitalRepository.IsExistsVital(request.SmartRxMasterId, request.PrescriptionId, request.VitalId);

         
            // Validation: Check for null or empty name
            if (string.IsNullOrWhiteSpace(request.Name))
            {
                responseResult.ApiResponseResult = new ApiResponseResult
                {
                    Data = null,
                    StatusCode = StatusCodes.Status404NotFound,
                    Status = "Failed",
                    Message = "Reward badge name is required"
                };
                return responseResult;                
            }

            // Validation: Check name length
            if (request.Name.Length > 150)
            {
                responseResult.ApiResponseResult = new ApiResponseResult
                {
                    Data = null,
                    StatusCode = StatusCodes.Status417ExpectationFailed,
                    Status = "Failed",
                    Message = "Reward badge name cannot exceed 150 characters"
                };
                return responseResult;               
            }

            // Validation: Check description length
            if (!string.IsNullOrEmpty(request.Description) && request.Description.Length > 500)
            {
                responseResult.ApiResponseResult = new ApiResponseResult
                {
                    Data = null,
                    StatusCode = StatusCodes.Status417ExpectationFailed,
                    Status = "Failed",
                    Message = "Reward badge description cannot exceed 500 characters"
                };
                return responseResult;
            }

            // Validation: Check for duplicate name in handler
            var allBadges = await _rewardBadgeRepository.GetAllRewardBadgesAsync(
                new Domain.CommonDTO.PagingSortingParams { PageNumber = 1, PageSize = int.MaxValue, SortBy = "Name", SortDirection = "asc" },
                cancellationToken);

            var duplicateExists = allBadges.Data.Any(rb => 
                rb.Name.Equals(request.Name, StringComparison.OrdinalIgnoreCase));

            if (duplicateExists)
            {
                responseResult.ApiResponseResult = new ApiResponseResult
                {
                    Data = null,
                    StatusCode = StatusCodes.Status417ExpectationFailed,
                    Status = "Failed",
                    Message = $"A reward badge with the name '{request.Name}' already exists"
                };
                return responseResult;
            }

            var rewardBadge = new Configuration_RewardBadge
            {
                Name = request.Name,
                Description = request.Description,
                CreatedById = request.UserId,
                CreatedDate = DateTime.UtcNow,
                IsActive = true
            };

            var newBadge = await _rewardBadgeRepository.CreateRewardBadgeAsync(rewardBadge, cancellationToken);
            
            var dto= new RewardBadgeDTO
            {
                Id = newBadge.Id,
                Name = newBadge.Name,
                Description = newBadge.Description,
                CreatedById = newBadge.CreatedById ?? 0,
                CreatedDate = newBadge.CreatedDate,
                IsActive = newBadge.IsActive
            };
             responseResult.ApiResponseResult = new ApiResponseResult
            {
                Data = dto,
                StatusCode = StatusCodes.Status200OK,
                Status = "Success",
                Message = "Reward badge created successfully"
            };
            return responseResult;
        }
    }
}

