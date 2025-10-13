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

namespace PMSBackend.Application.Commands.Reward
{
    public class UpdateRewardCommand : IRequest<RewardsDTO>
    {
        public long Id { get; set; }
        public string Heading { get; set; }
        public string? Details { get; set; }
        public bool IsNegativePointAllowed { get; set; }
        public int NonCashablePoints { get; set; }
        public bool IsCashable { get; set; }
        public int? CashablePoints { get; set; }
        public bool? IsActive { get; set; }
        public long UserId { get; set; }
    }

    public class UpdateRewardCommandHandler : IRequestHandler<UpdateRewardCommand, RewardsDTO>
    {
        private readonly IRewardRepository _rewardRepository;

        public UpdateRewardCommandHandler(IRewardRepository rewardRepository)
        {
            _rewardRepository = rewardRepository;
        }

        public async Task<RewardsDTO> Handle(UpdateRewardCommand request, CancellationToken cancellationToken)
        {
            var responseResult = new RewardsDTO();

            // Validation: Check for null or empty heading
            if (string.IsNullOrWhiteSpace(request.Heading))
            {
                responseResult.ApiResponseResult = new ApiResponseResult
                {
                    Data = null,
                    StatusCode = StatusCodes.Status404NotFound,
                    Status = "Failed",
                    Message = "Reward heading is required"
                };
                return responseResult;
            }

            // Validation: Check heading length
            if (request.Heading.Length > 150)
            {
                responseResult.ApiResponseResult = new ApiResponseResult
                {
                    Data = null,
                    StatusCode = StatusCodes.Status417ExpectationFailed,
                    Status = "Failed",
                    Message = "Reward heading cannot exceed 150 characters"
                };
                return responseResult;
            }

            // Validation: Check details length
            if (!string.IsNullOrEmpty(request.Details) && request.Details.Length > 500)
            {
                responseResult.ApiResponseResult = new ApiResponseResult
                {
                    Data = null,
                    StatusCode = StatusCodes.Status417ExpectationFailed,
                    Status = "Failed",
                    Message = "Reward details cannot exceed 500 characters"
                };
                return responseResult;
            }

            // Validation: Check points are non-negative
            if (request.NonCashablePoints < 0)
            {
                responseResult.ApiResponseResult = new ApiResponseResult
                {
                    Data = null,
                    StatusCode = StatusCodes.Status417ExpectationFailed,
                    Status = "Failed",
                    Message = "Non-cashable points cannot be negative"
                };
                return responseResult;
            }

            if (request.IsCashable && request.CashablePoints.HasValue && request.CashablePoints.Value < 0)
            {
                responseResult.ApiResponseResult = new ApiResponseResult
                {
                    Data = null,
                    StatusCode = StatusCodes.Status417ExpectationFailed,
                    Status = "Failed",
                    Message = "Cashable points cannot be negative"
                };
                return responseResult;
            }

            // Validation: Check if reward exists
            var existingReward = await _rewardRepository.GetRewardByIdAsync(request.Id, cancellationToken);
            if (existingReward == null)
            {
                responseResult.ApiResponseResult = new ApiResponseResult
                {
                    Data = null,
                    StatusCode = StatusCodes.Status404NotFound,
                    Status = "Failed",
                    Message = $"Reward with ID {request.Id} not found"
                };
                return responseResult;
            }

            // Validation: Check for duplicate heading (excluding current reward)
            var allRewards = await _rewardRepository.GetAllRewardsAsync(
                new Domain.CommonDTO.PagingSortingParams { PageNumber = 1, PageSize = int.MaxValue, SortBy = "Heading", SortDirection = "asc" },
                cancellationToken);

            var duplicateExists = allRewards.Data.Any(r =>
                r.Id != request.Id &&
                r.Heading.Equals(request.Heading, StringComparison.OrdinalIgnoreCase));

            if (duplicateExists)
            {
                responseResult.ApiResponseResult = new ApiResponseResult
                {
                    Data = null,
                    StatusCode = StatusCodes.Status417ExpectationFailed,
                    Status = "Failed",
                    Message = $"A reward with the heading '{request.Heading}' already exists"
                };
                return responseResult;
            }

            var reward = new Configuration_Reward
            {
                Id = request.Id,
                Heading = request.Heading,
                Details = request.Details,
                IsNegativePointAllowed = request.IsNegativePointAllowed,
                NonCashablePoints = request.NonCashablePoints,
                IsCashable = request.IsCashable,
                CashablePoints = request.CashablePoints,
                IsActive = request.IsActive,
                ModifiedById = request.UserId
            };

            var updatedReward = await _rewardRepository.UpdateRewardAsync(reward, cancellationToken);

            var dto = new RewardDTO
            {
                Id = updatedReward.Id,
                Heading = updatedReward.Heading,
                Details = updatedReward.Details,
                IsNegativePointAllowed = updatedReward.IsNegativePointAllowed,
                NonCashablePoints = updatedReward.NonCashablePoints,
                IsCashable = updatedReward.IsCashable,
                CashablePoints = updatedReward.CashablePoints,
                CreatedById = updatedReward.CreatedById ?? 0,
                CreatedDate = updatedReward.CreatedDate,
                ModifiedById = updatedReward.ModifiedById,
                ModifiedDate = updatedReward.ModifiedDate,
                IsActive = updatedReward.IsActive
            };

            responseResult.ApiResponseResult = new ApiResponseResult
            {
                Data = dto,
                StatusCode = StatusCodes.Status200OK,
                Status = "Success",
                Message = "Reward updated successfully"
            };
            return responseResult;
        }
    }
}


