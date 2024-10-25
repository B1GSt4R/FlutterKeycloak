
using Keycloak.AuthServices.Authentication;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.OpenApi.Models;
using System.Reflection;

namespace restapi
{
  public class Program
  {
    public static void Main (string[] args)
    {
      var builder = WebApplication.CreateBuilder (args);

      // Add services to the container.

      builder.Services.AddControllers ();
      // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
      builder.Services.AddEndpointsApiExplorer ();
      builder.Services.AddSwaggerGen (options =>
      {
        options.SwaggerDoc ("v1", new OpenApiInfo { Title = "My API", Version = "v1" });
        options.AddSecurityDefinition ("Keycloak", new OpenApiSecurityScheme
        {
          Type = SecuritySchemeType.OAuth2,
          Flows = new OpenApiOAuthFlows
          {
            Implicit = new OpenApiOAuthFlow
            {
              AuthorizationUrl = new Uri ("http://localhost:8080/auth/realms/DeLaKom/protocol/openid-connect/auth"),
              Scopes = new Dictionary<string, string>
              {
                { "openid","openid" },
                { "profile","profile" }
              }
            }
          }
        });
        OpenApiSecurityScheme keycloakSecurityScheme = new ()
        {
          Reference = new OpenApiReference
          {
            Id = "Keycloak",
            Type = ReferenceType.SecurityScheme,
          },
          In = ParameterLocation.Header,
          Name = "Bearer",
          Scheme = "Bearer",
        };

        options.AddSecurityRequirement (new OpenApiSecurityRequirement
        {
            { keycloakSecurityScheme, Array.Empty<string>() },
        });

        var xmlFile = $"{Assembly.GetExecutingAssembly ().GetName ().Name}.xml";
        var xmlPath = Path.Combine (AppContext.BaseDirectory, xmlFile);
        options.IncludeXmlComments (xmlPath);
      });
      builder.Services.AddAuthentication (JwtBearerDefaults.AuthenticationScheme);
      builder.Services.AddKeycloakWebApiAuthentication (builder.Configuration);
      builder.Services.AddAuthorization ();
      //builder.Services.AddAuthorization (options =>
      //{
      //  options.AddPolicy("AdminAndUser", b =>
      //  {
      //    b.RequireRealmRoles("User").RequireResourceRoles("Admin");
      //  });
      //}).AddKeycloakAuthorization(builder.Configuration);

      var app = builder.Build ();

      // Configure the HTTP request pipeline.
      if (app.Environment.IsDevelopment ())
      {
        app.UseSwagger ();
        app.UseSwaggerUI (options =>
        {
          options.SwaggerEndpoint ("/swagger/v1/swagger.json", "API v1");
          options.OAuthClientId ("delakom");
        });
      }

      app.UseHttpsRedirection ();

      app.UseRouting ();

      app.UseAuthentication (); // Required
      app.UseAuthorization (); // Required

      app.UseEndpoints (endpoints =>
          endpoints.MapControllers ());

      app.Run ();
    }
  }
}
