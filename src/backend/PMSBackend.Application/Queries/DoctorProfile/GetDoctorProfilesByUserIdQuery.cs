using MediatR;
using Microsoft.AspNetCore.Http;
using PMSBackend.Application.CommonServices;
using PMSBackend.Application.DTOs;
using PMSBackend.Domain.CommonDTO;
using PMSBackend.Domain.Repositories;
using PMSBackend.Domain.SharedContract;

namespace PMSBackend.Application.Queries.DoctorProfile
{
    public class GetDoctorProfilesByUserIdQuery : IRequest<PaginatedResult<DoctorProfileListItemDTO>>
    {
        public long UserId { get; set; }

        public long? DoctorId { get; set; }

        public string? SearchKeyword { get; set; }
        public string? SearchColumn { get; set; }

        public PagingSortingParams PagingSorting { get; set; }

    }

    public class GetDoctorProfilesByUserIdQueryHandler : IRequestHandler<GetDoctorProfilesByUserIdQuery, PaginatedResult<DoctorProfileListItemDTO>>
    {
        private readonly IDoctorProfileRepository _doctorProfileRepository;
        public GetDoctorProfilesByUserIdQueryHandler(IDoctorProfileRepository doctorProfileRepository)
        {
            _doctorProfileRepository = doctorProfileRepository;
        }

        public async Task<PaginatedResult<DoctorProfileListItemDTO>> Handle(GetDoctorProfilesByUserIdQuery request, CancellationToken cancellationToken)
        {
            try
            {
                var result = await _doctorProfileRepository.GetDoctorProfilesByUserIdWithPagingAsync(request.UserId, request.DoctorId, request.SearchKeyword, request.SearchColumn, request.PagingSorting, cancellationToken);

                var mapped = result.Data.Select(p => new DoctorProfileListItemDTO
                {
                    DoctorId = p.DoctorId,
                    DoctorCode = p.DoctorCode,
                    DoctorTitle = p.DoctorTitle,
                    DoctorFirstName = p.DoctorFirstName,
                    DoctorLastName = p.DoctorLastName,
                    ProfilePhotoName = p.ProfilePhotoName,
                    ProfilePhotoPath = p.ProfilePhotoPath,
                    RegistrationNumber = p.RegistrationNumber,
                    DoctorRating = p.DoctorRating,
                    SmartRxCount = p.SmartRxCount ?? 0
                }).ToList();

                return new PaginatedResult<DoctorProfileListItemDTO>(
                    mapped,
                    result.TotalRecords,
                    result.PageNumber,
                    result.PageSize,
                    result.SortBy,
                    result.SortDirection,
                    result.message
                );
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}


