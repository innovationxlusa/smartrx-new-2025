using PMSBackend.Domain.SharedContract;
using System.Threading;
using System.Threading.Tasks;

namespace PMSBackend.Domain.Repositories
{
    public interface IDashboardRepository
    {
        Task<DashboardSummaryContract> GetDashboardSummaryAsync(long userId, CancellationToken cancellationToken);
    }
}


