using MediatR;
using Microsoft.AspNetCore.Http;
using PMSBackend.Application.CommonServices;
using PMSBackend.Application.DTOs;
using PMSBackend.Domain.Entities;
using PMSBackend.Domain.Repositories;
using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace PMSBackend.Application.Commands.RewardBadge
{
    public class UpdateRewardBadgeCommand : IRequest<RewardBadgesDTO>
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string? Description { get; set; }
        public bool IsActive { get; set; }
        public long UserId { get; set; }
    }

    public class UpdateRewardBadgeCommandHandler : IRequestHandler<UpdateRewardBadgeCommand, RewardBadgesDTO>
    {
        private readonly IRewardBadgeRepository _rewardBadgeRepository;

        public UpdateRewardBadgeCommandHandler(IRewardBadgeRepository rewardBadgeRepository)
        {
            _rewardBadgeRepository = rewardBadgeRepository;
        }

        public async Task<RewardBadgesDTO> Handle(UpdateRewardBadgeCommand request, CancellationToken cancellationToken)
        {
            var responseResult = new RewardBadgesDTO();

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

            // Validation: Check if badge exists
            var existingBadge = await _rewardBadgeRepository.GetRewardBadgeByIdAsync(request.Id, cancellationToken);
            if (existingBadge == null)
            {
                responseResult.ApiResponseResult = new ApiResponseResult
                {
                    Data = null,
                    StatusCode = StatusCodes.Status404NotFound,
                    Status = "Failed",
                    Message = $"Reward badge with ID {request.Id} not found"
                };
                return responseResult;
            }

            // Validation: Check for duplicate name in handler (excluding current badge)
            var allBadges = await _rewardBadgeRepository.GetAllRewardBadgesAsync(
                new Domain.CommonDTO.PagingSortingParams { PageNumber = 1, PageSize = int.MaxValue, SortBy = "Name", SortDirection = "asc" },
                cancellationToken);

            var duplicateExists = allBadges.Data.Any(rb => 
                rb.Id != request.Id && 
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
                Id = request.Id,
                Name = request.Name,
                Description = request.Description,
                IsActive = request.IsActive,
                ModifiedById = request.UserId
            };

            var updatedBadge = await _rewardBadgeRepository.UpdateRewardBadgeAsync(rewardBadge, cancellationToken);

            var dto = new RewardBadgeDTO
            {
                Id = updatedBadge.Id,
                Name = updatedBadge.Name,
                Description = updatedBadge.Description,
                CreatedById = updatedBadge.CreatedById ?? 0,
                CreatedDate = updatedBadge.CreatedDate,
                ModifiedById = updatedBadge.ModifiedById,
                ModifiedDate = updatedBadge.ModifiedDate,
                IsActive = updatedBadge.IsActive
            };

            responseResult.ApiResponseResult = new ApiResponseResult
            {
                Data = dto,
                StatusCode = StatusCodes.Status200OK,
                Status = "Success",
                Message = "Reward badge updated successfully"
            };
            return responseResult;
        }
    }
}

