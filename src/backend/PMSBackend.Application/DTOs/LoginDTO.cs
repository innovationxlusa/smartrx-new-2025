using PMSBackend.Application.CommonServices;

namespace PMSBackend.Application.DTOs
{
    public class LoginDTO
    {
        public long UserId { get; set; }
        public int AuthType { get; set; }
        public string otp { get; set; }
        public string AccessToken { get; set; }

        public ApiResponseResult? ApiResponseResult { get; set; }
    }
}
