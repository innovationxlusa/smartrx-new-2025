namespace PMSBackend.Domain.Entities
{
    public class JwtSettings
    {
        public string SecretKey { get; set; }
        public string Issuer { get; set; }
        public string Audience { get; set; }
        public int ExpiryMinutes { get; set; }
    }
    public static class JwtConfig
    {
        public static JwtSettings Settings { get; private set; }

        public static void Initialize(JwtSettings settings)
        {
            Settings = settings;
        }
    }

}
