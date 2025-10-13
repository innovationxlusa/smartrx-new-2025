using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PMSBackend.Application.CommonServices;
using PMSBackend.Application.CommonServices.Exceptions;
using PMSBackend.Domain.Entities;
using System.Net;
using System.Net.Http.Headers;
using System.Security.Claims;
using System.Text;
using System.Text.Json;

namespace PMSBackend.API.Common
{
    public class ExceptionMiddleware //: IMiddleware
    {
        private readonly RequestDelegate _next;

        private readonly string _LogApiUrl;

        private readonly string _AppName;
     
        private readonly ILogger<ExceptionMiddleware> _logger;
        private readonly IHostEnvironment _env;

        public ExceptionMiddleware(RequestDelegate next,  ILogger<ExceptionMiddleware> logger, IHostEnvironment env)
        {
            _next = next;
            //_LogApiUrl = config.APIDomain + "/v2/log";
            _AppName = "SmartRxApp";
            _env = env;
            _logger = logger;
        }

        public async Task InvokeAsync(HttpContext context)
        {
            try
            {
                await _next(context); // Proceed to next middleware
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "An Error occured. Unhandled exception "+ex.Message+" "+ex.InnerException+" Stack Trace: "+ex.StackTrace);
                await HandleExceptionAsync(context, ex);
            }
        }
        private Task HandleExceptionAsync(HttpContext context, Exception exception)
        {
            context.Response.ContentType = "application/json";
            int statusCode = exception switch
            {               
                NotFoundException => StatusCodes.Status404NotFound,
                BadRequestException => StatusCodes.Status400BadRequest,
                UnprocessableEntityException => StatusCodes.Status422UnprocessableEntity,
                ValidationException => StatusCodes.Status400BadRequest,
                UnauthorizedAccessException => StatusCodes.Status401Unauthorized,
                ArgumentException => StatusCodes.Status400BadRequest,
                //ArgumentNullException => StatusCodes.Status400BadRequest,              
                //ForbiddenAccessException => StatusCodes.Status403Forbidden,
                KeyNotFoundException => StatusCodes.Status404NotFound,
                ConflictException => StatusCodes.Status409Conflict,
                InvalidOperationException => StatusCodes.Status409Conflict,
                TimeoutException => StatusCodes.Status408RequestTimeout,
                NotImplementedException => StatusCodes.Status501NotImplemented,
                OperationCanceledException => StatusCodes.Status499ClientClosedRequest,

                _ => (int)HttpStatusCode.InternalServerError
            };
            context.Response.StatusCode = statusCode;           
            var response = _env.IsDevelopment()
                ? new ApiResponseResult
                {
                    Status = "Failed",
                    StatusCode = context.Response.StatusCode,
                    Message = "An error occurred. Please contact with system administrator. "+exception.Message + " " + exception.InnerException,
                    StackTrace = exception.StackTrace,
                    HRResult=exception.HResult
                }
                : new ApiResponseResult
                {
                    Status = "Failed",
                    StatusCode = context.Response.StatusCode,
                    Message = "An error occurred. Please contact with system administrator. " + exception.Message + " " + exception.InnerException,
                    StackTrace = exception.StackTrace,
                    HRResult = exception.HResult
                    //Status = "Failed",
                    //StatusCode = context.Response.StatusCode,
                    //Message = "An error occurred. Please contact with system administrator."
                };

            var options = new JsonSerializerOptions { PropertyNamingPolicy = JsonNamingPolicy.CamelCase };

            return context.Response.WriteAsync(JsonSerializer.Serialize(response, options));
        
        }
       

        //public async Task InvokeAsync(HttpContext context)
        //{
        //    try
        //    {
        //        await _next(context);
        //    }
        //    catch (Exception ex)
        //    {
        //        HttpResponse response = context.Response;
        //        response.ContentType = "application/json";
        //        string text;
        //        if (ex is Microsoft.AspNetCore.Http.BadHttpRequestException)
        //        {
        //            response.StatusCode = 404;
        //            text = JsonSerializer.Serialize(new
        //            {
        //                status = "error",
        //                statusCode = 404,
        //                type = "https://datatracker.ietf.org/doc/html/rfc7231#section-6.5.1",
        //                message = ex?.Message,
        //                title = "Something went wrong!",
        //                traceId = context.TraceIdentifier
        //            });
        //        }
        //        else
        //        {
        //            response.StatusCode = 500;
        //            text = JsonSerializer.Serialize(new
        //            {
        //                status = "error",
        //                statusCode = 500,
        //                type = "https://datatracker.ietf.org/doc/html/rfc7231#section-6.6.1",
        //                message = ex?.Message,
        //                title = "Something went wrong!",
        //                traceId = context.TraceIdentifier
        //            });
        //        }

        //        string value = "";
        //        string value2 = "";
        //        try
        //        {
        //            if (context.User != null)
        //            {
        //                ClaimsIdentity? obj = context.User.Identity as ClaimsIdentity;
        //                value = obj.FindFirst("jak").Value;
        //                value2 = obj.FindFirst("jid").Value;
        //            }
        //        }
        //        catch
        //        {
        //        }

        //        new Dictionary<string, string>();
        //        PMSLogModel logModel = new PMSLogModel
        //        {
        //            Level = "Error",
        //            AppName = _AppName,
        //            Message = (ex?.Message ?? ""),
        //            Others = new Dictionary<string, string>
        //        {
        //            {
        //                "TraceID",
        //                context?.TraceIdentifier ?? ""
        //            },
        //            {
        //                "RequestPath",
        //                context?.Request?.Path ?? ((PathString)"")
        //            },
        //            { "CLientKey", value },
        //            { "UserId", value2 }
        //        },
        //            Exception = new ExceptionDetails
        //            {
        //                Message = ex?.Message,
        //                StackTrace = ex?.StackTrace
        //            }
        //        };
        //        await Task.Run(async delegate
        //        {
        //            using HttpRequestMessage requestMessage = new HttpRequestMessage(HttpMethod.Post, _LogApiUrl);
        //            requestMessage.Headers.Authorization = new AuthenticationHeaderValue("Basic", "cHJlbWlzZTpjMC5DeGZjb2RlakU5XkhySl84NXNkZ2Y3NjU0ISE=");
        //            requestMessage.Content = new StringContent(JsonSerializer.Serialize(logModel), Encoding.UTF8, "application/json");
        //            await (await new HttpClient().SendAsync(requestMessage)).Content.ReadAsStringAsync();
        //        });
        //        await response.WriteAsync(text);
        //    }
        //}

        //public async Task InvokeAsync(HttpContext context, RequestDelegate next)
        //{
        //    try
        //    {
        //        await _next(context);
        //    }
        //    catch (Exception ex)
        //    {
        //        HttpResponse response = context.Response;
        //        response.ContentType = "application/json";
        //        string text;
        //        if (ex is Microsoft.AspNetCore.Http.BadHttpRequestException)
        //        {
        //            response.StatusCode = 404;
        //            text = JsonSerializer.Serialize(new
        //            {
        //                status = "error",
        //                statusCode = 404,
        //                type = "https://datatracker.ietf.org/doc/html/rfc7231#section-6.5.1",
        //                message = ex?.Message,
        //                title = "Something went wrong!",
        //                traceId = context.TraceIdentifier
        //            });
        //        }
        //        else
        //        {
        //            response.StatusCode = 500;
        //            text = JsonSerializer.Serialize(new
        //            {
        //                status = "error",
        //                statusCode = 500,
        //                type = "https://datatracker.ietf.org/doc/html/rfc7231#section-6.6.1",
        //                message = ex?.Message,
        //                title = "Something went wrong!",
        //                traceId = context.TraceIdentifier
        //            });
        //        }

        //        string value = "";
        //        string value2 = "";
        //        try
        //        {
        //            if (context.User != null)
        //            {
        //                ClaimsIdentity? obj = context.User.Identity as ClaimsIdentity;
        //                value = obj.FindFirst("jak").Value;
        //                value2 = obj.FindFirst("jid").Value;
        //            }
        //        }
        //        catch
        //        {
        //        }

        //        new Dictionary<string, string>();
        //        PMSLogModel logModel = new PMSLogModel
        //        {
        //            Level = "Error",
        //            AppName = _AppName,
        //            Message = (ex?.Message ?? ""),
        //            Others = new Dictionary<string, string>
        //        {
        //            {
        //                "TraceID",
        //                context?.TraceIdentifier ?? ""
        //            },
        //            {
        //                "RequestPath",
        //                context?.Request?.Path ?? ((PathString)"")
        //            },
        //            { "CLientKey", value },
        //            { "UserId", value2 }
        //        },
        //            Exception = new ExceptionDetails
        //            {
        //                Message = ex?.Message,
        //                StackTrace = ex?.StackTrace
        //            }
        //        };
        //        await Task.Run(async delegate
        //        {
        //            using HttpRequestMessage requestMessage = new HttpRequestMessage(HttpMethod.Post, _LogApiUrl);
        //            requestMessage.Headers.Authorization = new AuthenticationHeaderValue("Basic", "cHJlbWlzZTpjMC5DeGZjb2RlakU5XkhySl84NXNkZ2Y3NjU0ISE=");
        //            requestMessage.Content = new StringContent(JsonSerializer.Serialize(logModel), Encoding.UTF8, "application/json");
        //            await (await new HttpClient().SendAsync(requestMessage)).Content.ReadAsStringAsync();
        //        });
        //        await response.WriteAsync(text);
        //    }
        //}
    }

}