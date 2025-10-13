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
    public class CreateRewardCommand : IRequest<RewardsDTO>
    {
        public string Heading { get; set; }
        public string? Details { get; set; }
        public bool IsNegativePointAllowed { get; set; }
        public int NonCashablePoints { get; set; }
        public bool IsCashable { get; set; }
        public int? CashablePoints { get; set; }
        public long UserId { get; set; }
    }

    public class CreateRewardCommandHandler : IRequestHandler<CreateRewardCommand, RewardsDTO>
    {
        private readonly IRewardRepository _rewardRepository;

        public CreateRewardCommandHandler(IRewardRepository rewardRepository)
        {
            _rewardRepository = rewardRepository;
        }

        public async Task<RewardsDTO> Handle(CreateRewardCommand request, CancellationToken cancellationToken)
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

            // Validation: Check for duplicate heading
            var allRewards = await _rewardRepository.GetAllRewardsAsync(
                new Domain.CommonDTO.PagingSortingParams { PageNumber = 1, PageSize = int.MaxValue, SortBy = "Heading", SortDirection = "asc" },
                cancellationToken);

            var duplicateExists = allRewards.Data.Any(r =>
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
                Heading = request.Heading,
                Details = request.Details,
                IsNegativePointAllowed = request.IsNegativePointAllowed,
                NonCashablePoints = request.NonCashablePoints,
                IsCashable = request.IsCashable,
                CashablePoints = request.CashablePoints,
                CreatedById = request.UserId,
                CreatedDate = DateTime.UtcNow,
                IsActive = true
            };

            var newReward = await _rewardRepository.CreateRewardAsync(reward, cancellationToken);

            var dto = new RewardDTO
            {
                Id = newReward.Id,
                Heading = newReward.Heading,
                Details = newReward.Details,
                IsNegativePointAllowed = newReward.IsNegativePointAllowed,
                NonCashablePoints = newReward.NonCashablePoints,
                IsCashable = newReward.IsCashable,
                CashablePoints = newReward.CashablePoints,
                CreatedById = newReward.CreatedById ?? 0,
                CreatedDate = newReward.CreatedDate,
                IsActive = newReward.IsActive
            };

            responseResult.ApiResponseResult = new ApiResponseResult
            {
                Data = dto,
                StatusCode = StatusCodes.Status200OK,
                Status = "Success",
                Message = "Reward created successfully"
            };
            return responseResult;
        }
    }
}

