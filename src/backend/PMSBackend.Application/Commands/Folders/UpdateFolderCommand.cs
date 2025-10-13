﻿using MediatR;
using Microsoft.AspNetCore.Http;
using PMSBackend.Application.CommonServices;
using PMSBackend.Application.DTOs;
using PMSBackend.Domain.Entities;
using PMSBackend.Domain.Repositories;

namespace PMSBackend.Application.Commands.Folders
{
    public class UpdateFolderCommand : IRequest<UserWiseFolderDTO>
    {
        public long Id { get; set; }
        public long? ParentFolderId { get; set; }
        public long? PreviousFolderHierarchy { get; set; }
        public long? FolderHierarchy { get; set; }
        public string? FolderName { get; set; }
        public string? Description { get; set; }
        public long? PatientId { get; set; }
        public long LoginUserId { get; set; }


    }
    public class UpdateFolderCommandHandler : IRequestHandler<UpdateFolderCommand, UserWiseFolderDTO>
    {
        // private readonly ILogger<InsertPrescriptionUploadCommandHandler> _logger;
        private readonly IUserWiseFolderRepository _userWiseFolderRepository;
        public UpdateFolderCommandHandler(IUserWiseFolderRepository userWiseFolderRepository)
        {
            _userWiseFolderRepository = userWiseFolderRepository;
        }

        public async Task<UserWiseFolderDTO> Handle(UpdateFolderCommand request, CancellationToken cancellationtoken)
        {
            try
            {
                var responseResult = new UserWiseFolderDTO();
                var IsExistsFolder = await _userWiseFolderRepository.IsExistsThisFolder(request.Id);
                if (!IsExistsFolder)
                {
                    responseResult.ApiResponseResult = new ApiResponseResult
                    {
                        Data = null,
                        StatusCode = StatusCodes.Status400BadRequest,
                        Status = "Failed",
                        Message = "Folder does not exists!"
                    };
                    return responseResult;
                }
                var IsExistsFolderName = await _userWiseFolderRepository.IsExistsFolderName(request.FolderName, request.LoginUserId);
                if (IsExistsFolderName)
                {
                    responseResult.ApiResponseResult = new ApiResponseResult
                    {
                        Data = null,
                        StatusCode = StatusCodes.Status400BadRequest,
                        Status = "Failed",
                        Message = "Folder name already exists!"
                    };
                    return responseResult;
                }

                UserWiseFolderDTO patientDto = new();
                Prescription_UserWiseFolderEntity? entity = new();
                entity = await _userWiseFolderRepository.GetDetailsByIdAsync(request.Id);
                if (entity is not null)
                {
                    if (request.ParentFolderId is not null && request.ParentFolderId > 0) entity!.ParentFolderId = request.ParentFolderId;
                    if (request.FolderHierarchy is not null && request.FolderHierarchy > 0) entity!.FolderHierarchy = request.FolderHierarchy!.Value;
                    if (!string.IsNullOrWhiteSpace(request.FolderName)) entity!.FolderName = request.FolderName;
                    if (!string.IsNullOrWhiteSpace(request.Description)) entity!.Description = request.Description;
                    if (request.PatientId is not null && request.PatientId > 0) entity!.PatientId = request.PatientId;
                    entity!.UserId = request.LoginUserId;
                    entity.ModifiedById = request.LoginUserId;
                    entity.ModifiedDate = DateTime.Now;
                    var result = await _userWiseFolderRepository.UpdateAsync(entity!);
                    await Task.CompletedTask;
                    patientDto = new UserWiseFolderDTO()
                    {
                        Id = entity.Id,
                        FolderName = entity.FolderName,
                        Description = entity.Description!,
                        PatientId = entity.PatientId,
                        FolderHierarchy = entity.FolderHierarchy,
                        UserId = entity.UserId,
                        ParentFolderId = entity.ParentFolderId,
                        ApiResponseResult = null
                    };
                }
                return patientDto;
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
