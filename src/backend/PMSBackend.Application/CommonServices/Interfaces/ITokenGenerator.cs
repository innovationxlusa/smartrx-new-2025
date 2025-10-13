namespace PMSBackend.Application.CommonServices.Interfaces
{
    public interface ITokenGenerator
    {
        //public string GenerateToken(string userName, string password);
        Task<string> GenerateJWTToken(long userId);
        // Task<string> GenerateJWTToken(long id, string userName, List<long> list);
    }
}
