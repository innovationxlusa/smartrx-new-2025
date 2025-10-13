using Microsoft.EntityFrameworkCore;
using PMSBackend.Databases.Data;
using PMSBackend.Domain.Repositories;
using PMSBackend.Domain.SharedContract;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace PMSBackend.Databases.Repositories
{
    public class DashboardRepository : IDashboardRepository
    {
        private readonly PMSDbContext _db;

        public DashboardRepository(PMSDbContext db)
        {
            _db = db;
        }

        public async Task<DashboardSummaryContract> GetDashboardSummaryAsync(long userId, CancellationToken cancellationToken)
        {
            var totalPatients = await _db.Smartrx_PatientProfile.CountAsync(p => p.CreatedById == userId, cancellationToken);

            var totalDoctors = await _db.Smartrx_Doctor
                .Where(d => _db.Smartrx_Master.Any(m => m.Id == d.SmartRxMasterId && m.UserId == userId))
                .Select(d => d.DoctorId)
                .Distinct()
                .CountAsync(cancellationToken);

            var totalSmartRx = await _db.Smartrx_Master
                .CountAsync(m => m.UserId == userId && m.IsRecommended == true && m.IsApproved == true && m.IsCompleted == true, cancellationToken);

            var totalPending = await _db.Prescription_UploadedPrescription
                .CountAsync(p => p.UserId == userId && p.IsSmartRxRequested == true && (p.IsCompleted == null || p.IsCompleted == false), cancellationToken);

            var totalRxFileOnly = await _db.Prescription_UploadedPrescription
                .CountAsync(p => p.UserId == userId
                    && !(_db.Smartrx_Master.Any(m => m.PrescriptionId == p.Id && m.IsRecommended == true && m.IsApproved == true && m.IsCompleted == true))
                    && !(p.IsSmartRxRequested == true && (p.IsCompleted == null || p.IsCompleted == false)), cancellationToken);

            var totalEdex = 0; // Placeholder

            var expTotalDoctors = await _db.Smartrx_Doctor
                .Where(d => _db.Smartrx_Master.Any(m => m.Id == d.SmartRxMasterId && m.UserId == userId))
                .Select(d => d.Id)
                .CountAsync(cancellationToken);

            var totalMedicines = await _db.SmartRx_PatientMedicine
                .CountAsync(m => _db.Smartrx_Master.Any(s => s.Id == m.SmartRxMasterId && s.UserId == userId), cancellationToken);

            var totalTests = await _db.SmartRx_PatientInvestigation
                .CountAsync(i => _db.Smartrx_Master.Any(s => s.Id == i.SmartRxMasterId && s.UserId == userId), cancellationToken);

            var totalTransportCost = await _db.Smartrx_Doctor
                .Where(d => _db.Smartrx_Master.Any(m => m.Id == d.SmartRxMasterId && m.UserId == userId))
                .SumAsync(d => d.TransportExpense ?? 0, cancellationToken);

            var totalOtherCosts = await _db.Smartrx_Doctor
                .Where(d => _db.Smartrx_Master.Any(m => m.Id == d.SmartRxMasterId && m.UserId == userId))
                .SumAsync(d => d.OtherExpense ?? 0, cancellationToken);

            return new DashboardSummaryContract
            {
                UserSummary = new DashboardUserSummaryContract
                {
                    UserId = userId,
                    TotalPatients = totalPatients,
                    TotalDoctors = totalDoctors,
                    TotalRxFileOnly = totalRxFileOnly,
                    TotalSmartRx = totalSmartRx,
                    TotalPending = totalPending,
                    TotalEdex = totalEdex
                },
                ExpenseSummary = new DashboardExpenseSummaryContract
                {
                    UserId = userId,
                    TotalDoctors = expTotalDoctors,
                    TotalMedicines = totalMedicines,
                    TotalTests = totalTests,
                    TotalTransportCost = totalTransportCost,
                    TotalOtherCosts = totalOtherCosts
                }
            };
        }
    }
}


