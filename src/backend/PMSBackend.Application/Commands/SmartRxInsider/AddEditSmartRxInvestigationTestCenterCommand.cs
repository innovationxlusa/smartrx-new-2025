﻿using MediatR;
using Microsoft.AspNetCore.Http;
using PMSBackend.Application.CommonServices;
using PMSBackend.Application.DTOs;
using PMSBackend.Domain.Entities;
using PMSBackend.Domain.Repositories;

namespace PMSBackend.Application.Commands.SmartRxInsider
{
    public class AddEditSmartRxInvestigationTestCenterCommand : IRequest<SmartRxInvestigationDTO>
    {
        public long SmartRxMasterId { get; set; }
        public long PrescriptionId { get; set; }
        public List<SmartRxInvestigationListDTO> PatientTestCenterWiseList { get; set; }
        public long LoginUserId { get; set; }
    }

    public class AddEditSmartRxInvestigationTestCenterCommandHandler : IRequestHandler<AddEditSmartRxInvestigationTestCenterCommand, SmartRxInvestigationDTO>
    {
        // private readonly ILogger<InsertPrescriptionUploadCommandHandler> _logger;
        private readonly ISmartRxInsiderRepository _smartRxRepository;
        public AddEditSmartRxInvestigationTestCenterCommandHandler(ISmartRxInsiderRepository smartRxRepository)
        {
            _smartRxRepository = smartRxRepository;
        }

        public async Task<SmartRxInvestigationDTO> Handle(AddEditSmartRxInvestigationTestCenterCommand request, CancellationToken cancellationtoken)
        {
            try
            {
                var responseResult = new SmartRxInvestigationDTO();

                List<SmartRx_PatientInvestigationEntity> smartRxInvestigation = new List<SmartRx_PatientInvestigationEntity>();
                foreach (var investigation in request.PatientTestCenterWiseList)
                {
                    var inv = new SmartRx_PatientInvestigationEntity()
                    {
                        SmartRxMasterId = investigation.SmartRxMasterId,
                        PrescriptionId = investigation.PrescriptionId,
                        Id = investigation.Id,
                        TestId = investigation.TestId,
                        UserSelectedTestCenterIds = investigation.TestCenterIds,
                    };
                    smartRxInvestigation.Add(inv);
                }

                var smartRxInv = await _smartRxRepository.AddOrEditPatientInvestigationAsync(smartRxInvestigation, request.SmartRxMasterId, request.PrescriptionId, request.LoginUserId);
                if (smartRxInv is null)
                {
                    responseResult.ApiResponseResult = new ApiResponseResult
                    {
                        Data = null,
                        StatusCode = StatusCodes.Status409Conflict,
                        Status = "Failed",
                        Message = "Investigation test centers not updated"
                    };
                    return responseResult;
                }

                await Task.CompletedTask;
                List<SmartRxInvestigationListDTO> list = new List<SmartRxInvestigationListDTO>();
                foreach (var investigation in smartRxInv)
                {
                    var inv = new SmartRxInvestigationListDTO()
                    {
                        Id = investigation.Id,
                        SmartRxMasterId = investigation.SmartRxMasterId,
                        PrescriptionId = investigation.PrescriptionId,
                        TestId = investigation.TestId,
                        TestCode = investigation.InvestigationTest.Code,
                        TestName = investigation.InvestigationTest.TestName,
                        TestDescription = investigation.InvestigationTest.TestDescription,
                        TestFullName = investigation.InvestigationTest.TestFullName,
                        TestShortName = investigation.InvestigationTest.TestShortName,
                        TestNameByDiagnosticCenter = string.Empty,
                        TestUnitPrice = investigation.TestPrice ?? 0,

                        TestPriceName = investigation.PriceUnit!.Name,
                        TestPriceMeasurementUnit = investigation.PriceUnit.MeasurementUnit??string.Empty,
                        TestPriceType = investigation.PriceUnit.Type,
                        TestCenterIds = investigation.UserSelectedTestCenterIds,
                        TestCenters = investigation.UserSelectedTestCenters
                    };

                    list.Add(inv);
                }
                responseResult.smartRxInsiderInvestigationList = list;
                responseResult.ApiResponseResult = null;
                return responseResult;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
