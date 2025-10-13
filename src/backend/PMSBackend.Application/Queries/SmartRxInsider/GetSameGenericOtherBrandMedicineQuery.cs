using MediatR;
using Microsoft.AspNetCore.Http;
using PMSBackend.Application.CommonServices;
using PMSBackend.Application.DTOs;
using PMSBackend.Domain.CommonDTO;
using PMSBackend.Domain.Repositories;
using PMSBackend.Domain.SharedContract;

namespace PMSBackend.Application.Queries.SmartRxInsider
{
    public class GetSameGenericOtherBrandMedicineQuery : IRequest<MedicineCompareDTO>
    {
        public long SmartRxMasterId { get; set; }

        public long PrescriptionId { get; set; }

        public long PatientMedicineId { get; set; }
        public long MedicineId { get; set; }
        public PagingSortingParams PagingSorting { get; set; }
    }

    public class GetSameGenericOtherBrandMedicineQueryHandler : IRequestHandler<GetSameGenericOtherBrandMedicineQuery, MedicineCompareDTO>
    {
        private readonly IMedicineCompareRepository _medicineCompareRepository;

        public GetSameGenericOtherBrandMedicineQueryHandler(IMedicineCompareRepository medicineCompareRepository)
        {
            _medicineCompareRepository = medicineCompareRepository;
        }
        public async Task<MedicineCompareDTO> Handle(GetSameGenericOtherBrandMedicineQuery request, CancellationToken cancellationToken)
        {
            try
            {
                MedicineCompareDTO responseResult = new MedicineCompareDTO();
                List<MedicineInfoDto> comparedMedicineList = new List<MedicineInfoDto>();
                PaginatedResult<MedicineInfoDto> pagedCompareList = new PaginatedResult<MedicineInfoDto>();
                var compareToMedicine = await _medicineCompareRepository.CheckThisMedicineExists(request.MedicineId);
                if (compareToMedicine is null)
                {
                    responseResult.ApiResponseResult = new ApiResponseResult
                    {
                        Data = null,
                        StatusCode = StatusCodes.Status400BadRequest,
                        Status = "Failed",
                        Message = "No medicine found!"
                    };
                    return responseResult;
                }

                var sameGenericOtherBrandMedicineList = await _medicineCompareRepository.ListOfSameGenericOtherBrandOfAMedicine(request.SmartRxMasterId, request.PrescriptionId, request.MedicineId, request.PagingSorting, cancellationToken);
                if (sameGenericOtherBrandMedicineList == null)
                {
                    responseResult.ApiResponseResult = new ApiResponseResult
                    {
                        Data = null,
                        StatusCode = StatusCodes.Status400BadRequest,
                        Status = "Failed",
                        Message = "No other medicine found to compare!"
                    };
                    return responseResult;
                }

                var medicineWishlist = await _medicineCompareRepository.GetMedicineWishlist(request.PatientMedicineId, request.MedicineId, request.PagingSorting.PageNumber);

                var compareToMedicineDTO = new MedicineInfoDto()
                {
                    MedicineId = compareToMedicine.Id,
                    MedicineName = compareToMedicine.Name,
                    BrandCode = compareToMedicine.Brand.BrandCode,
                    BrandName = compareToMedicine.Brand.Name,
                    ManufacturerName = compareToMedicine.Brand.Manufacturer.Name,
                    ManufacturerOriginRegion = compareToMedicine.Brand.Manufacturer.OriginRegion,
                    Importer = compareToMedicine.Brand.Manufacturer.Importer,
                    Type = compareToMedicine.Type,
                    Slug = compareToMedicine.Slug,
                    MedicineDosageFormName = compareToMedicine.MedicineDosageForm.Name,
                    MedicineDosageFormShortForm = compareToMedicine.MedicineDosageForm.ShortForm,
                    GenericName = compareToMedicine.Generic.Name,
                    Strength = compareToMedicine.Strength,
                    MeasurementUnit = compareToMedicine.MeasurementUnit.MeasurementUnit,
                    MeasurementUnitName = compareToMedicine.MeasurementUnit.Name,
                    MeasurementUnitType = compareToMedicine.MeasurementUnit.Type,
                    UnitPriceValue = compareToMedicine.UnitPrice,
                    UnitPriceName = compareToMedicine.PriceUnit.Name,
                    UnitPriceType = compareToMedicine.PriceUnit.Type,
                    UserFor = compareToMedicine.UserFor,
                    CompanyDiscount = compareToMedicine.CompanyDiscountPercentage,
                    IsActive = compareToMedicine.IsActive,
                    WishList = medicineWishlist != null ? medicineWishlist.Wishlist : null,
                    Wished = medicineWishlist != null && medicineWishlist.Wishlist != null ? true : false
                };
                Parallel.ForEach(sameGenericOtherBrandMedicineList.Data, m =>
                {
                    var comparedMedicine = new MedicineInfoDto()
                    {
                        MedicineId = m.MedicineId,
                        MedicineName = m.MedicineName,
                        BrandCode = m.BrandCode,
                        BrandName = m.BrandName,
                        ManufacturerName = m.ManufacturerName,
                        ManufacturerOriginRegion = m.ManufacturerOriginRegion,
                        Importer = m.Importer,
                        Type = m.Type,
                        Slug = m.Slug,
                        MedicineDosageFormName = m.MedicineDosageFormName,
                        MedicineDosageFormShortForm = m.MedicineDosageFormShortForm,
                        GenericName = m.GenericName,
                        Strength = m.Strength,
                        MeasurementUnit = m.MeasurementUnit,
                        MeasurementUnitName = m.MeasurementUnitName,
                        MeasurementUnitType = m.MeasurementUnitType,
                        UnitPriceValue = m.UnitPriceValue,
                        UnitPriceName = m.UnitPriceName,
                        UnitPriceType = m.UnitPriceType,
                        UserFor = m.UserFor,
                        CompanyDiscount = m.CompanyDiscount,
                        IsActive = m.IsActive,

                    };
                    comparedMedicineList.Add(comparedMedicine);

                });
                pagedCompareList = new PaginatedResult<MedicineInfoDto>(comparedMedicineList, sameGenericOtherBrandMedicineList.TotalRecords, sameGenericOtherBrandMedicineList.PageNumber, sameGenericOtherBrandMedicineList.PageSize, sameGenericOtherBrandMedicineList.SortBy, sameGenericOtherBrandMedicineList.SortDirection, null);
                responseResult.SourceMedicine = compareToMedicineDTO;
                responseResult.ComparedMedicine = pagedCompareList;
                responseResult.ApiResponseResult = null;
                await Task.CompletedTask;
                return responseResult;
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}