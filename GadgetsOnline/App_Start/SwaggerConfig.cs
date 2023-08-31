/* using System.Web.Http;
using WebActivatorEx;
using GadgetsOnline;
using Swashbuckle.Application;
using System.Configuration;

namespace GadgetsOnline
{
    public class SwaggerConfig
    {
        public static void Register(HttpConfiguration config)
        {
            //    var thisAssembly = typeof(SwaggerConfig).Assembly;
            //  GlobalConfiguration.Configuration
            config.EnableSwagger(c =>
            {
                c.SingleApiVersion("v1", ConfigurationManager.Configuration.GetSection("appSettings")["ApplicationName"]);
            }).EnableSwaggerUi();
        }
    }
} */