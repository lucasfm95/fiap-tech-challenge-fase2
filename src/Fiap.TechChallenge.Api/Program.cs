using System.Text.Json.Serialization;
using Fiap.TechChallenge.Api.Configurations;
using Fiap.TechChallenge.Api.Middlewares;
using Fiap.TechChallenge.Infrastructure.Context;
using Microsoft.EntityFrameworkCore;
using Serilog;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddDbContext<ContactDbContext>(options =>
{
    options.UseNpgsql(Environment.GetEnvironmentVariable("CONNECTION_STRING_DB_POSTGRES"));
});

builder.Services.RegisterApplicationServices();
builder.Services.RegisterRepositories();
builder.Services.AddControllers()
    .AddJsonOptions(options =>
        options.JsonSerializerOptions.DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull);
builder.Services.AddEndpointsApiExplorer();
builder.Services.ConfigureSwagger();
builder.Services.AddHealthChecks()
    .AddNpgSql(Environment.GetEnvironmentVariable("CONNECTION_STRING_DB_POSTGRES") ?? 
               throw new Exception("CONNECTION_STRING_DB_POSTGRES not found."));
builder.Host.UseSerilog((context, configuration) => configuration.ReadFrom.Configuration(context.Configuration));

var app = builder.Build();
var env = Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT");
app.UseSwagger();
app.UseSwaggerUI();
app.UseHttpsRedirection();
app.UseAuthorization();
app.MapControllers();
app.UseHealthcheck();
app.UseMiddleware<ExceptionMiddleware>();
app.UseSerilogRequestLogging();

if (env == "IntegrationTests")
{
    await RunMigration();
}

app.Run();
return;

async Task RunMigration()
{
    using var scope = app.Services.CreateScope();
    var dbContext = scope.ServiceProvider.GetRequiredService<ContactDbContext>();
    await dbContext.Database.MigrateAsync();
}
public partial class Program
{

}