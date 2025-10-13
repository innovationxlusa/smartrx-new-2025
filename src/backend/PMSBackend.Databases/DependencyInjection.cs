using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using PMSBackend.Application.CommonServices.Interfaces;
using PMSBackend.Databases.Data;
using PMSBackend.Databases.Repositories;
using PMSBackend.Databases.Services;
using PMSBackend.Domain.Entities;
using PMSBackend.Domain.Repositories;
using System.Text;



namespace PMSBackend.Databases
{
    public static class DependencyInjection
    {
        public static IServiceCollection AddInfrastructure(this IServiceCollection services, IConfiguration configuration)
        {
            services
                .AddAuth()
                .AddContext(configuration)
                .AddPersistence();
            services.AddSingleton<IDateTimeProvider, DateTimeProvider>();

            return services;
        }


        public static IServiceCollection AddPersistence(
            this IServiceCollection services)
        {
            services.AddScoped(typeof(IBaseRepository<>), typeof(BaseRepository<>));

            services.AddScoped<IUserRepository, UserRepository>();
            services.AddScoped<IRoleRepository, RoleRepository>();
            services.AddScoped<IUserRoleRepository, UserRoleRepository>();
            services.AddScoped<IPrescriptionUploadRepository, PrescriptionUploadRepository>();
            services.AddScoped<IUserWiseFolderRepository, UserWiseFolderRepository>();
            services.AddScoped<IBrowseRxRepository, BrowseRxRepository>();
            services.AddScoped<IDashboardRepository, DashboardRepository>();
            services.AddScoped<ISmartRxInsiderRepository, SmartRxInsiderRepository>();
            services.AddScoped<ISmartRxVitalRepository, SmartRxVitalRepository>();
            services.AddScoped<IVitalRepository, VitalRepository>();
            services.AddScoped<IMedicineCompareRepository, MedicineCompareRepository>();
            services.AddScoped<IPatientProfileRepository, PatientProfileRepository>();
            services.AddScoped<IDoctorProfileRepository, DoctorProfileRepository>();
            services.AddScoped<ISmartRxOtherExpenseRepository, SmartRxOtherExpenseRepository>();
            services.AddScoped<IPatientRewardRepository, PatientRewardRepository>();
            services.AddScoped<IRewardRepository, RewardRepository>();
            services.AddScoped<IRewardBadgeRepository, RewardBadgeRepository>();

            return services;
        }

        public static IServiceCollection AddContext(
            this IServiceCollection services, IConfiguration configuration)
        {
            //    IConfigurationRoot configurationr = new ConfigurationBuilder()
            //.SetBasePath(Directory.GetCurrentDirectory())
            //.AddJsonFile("appsettings.json")
            //.Build();

            //    var connectionString = configuration.GetConnectionString("PMSDBConnection");

            //    var optionsBuilder = new DbContextOptionsBuilder<PMSDbContext>();
            //    optionsBuilder.UseSqlServer(connectionString);


            services.AddSingleton<DbConnector>();
            var dbConnector = new DbConnector(configuration);
            var connectionString = dbConnector.GetConnectionString("PMSDBConnection");

            // Register DbContext with the retrieved connection string
            services.AddDbContext<PMSDbContext>(options =>
                options.UseLazyLoadingProxies()
                       .UseSqlServer(connectionString,
                b => b.MigrationsAssembly(typeof(PMSDbContext).Assembly.FullName)
                .EnableRetryOnFailure(
                            maxRetryCount: 5,
                            maxRetryDelay: TimeSpan.FromSeconds(10),
                            errorNumbersToAdd: null))
                .EnableSensitiveDataLogging()
                .LogTo(Console.WriteLine, LogLevel.Information)
                );

            return services;
        }

        public static IServiceCollection AddAuth(
        this IServiceCollection services)
        {
            services.AddScoped<IUserRepository, UserRepository>();
            services.AddScoped<ITokenGenerator, TokenGenerator>();
            // Configuration for token
            services.AddAuthentication(x =>
            {
                x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                x.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(x =>
            {
                x.RequireHttpsMetadata = false;
                x.SaveToken = true;
                x.TokenValidationParameters = new TokenValidationParameters()
                {
                    ValidateIssuer = true,
                    ValidateAudience = true,
                    ValidateLifetime = true,
                    ValidateIssuerSigningKey = true,
                    ValidAudience = JwtConfig.Settings.Audience,
                    ValidIssuer = JwtConfig.Settings.Issuer,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(JwtConfig.Settings.SecretKey)),
                    ClockSkew = TimeSpan.FromMinutes(Convert.ToDouble(JwtConfig.Settings.ExpiryMinutes))
                };
            });
            return services;
        }
    }
}