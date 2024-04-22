using HelloBlazor.Components;
using HelloBlazor.Data;
using HelloBlazor.Services;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorComponents()
	.AddInteractiveServerComponents();

builder.Services.AddScoped<OrderState>();

// To load entity  controllers
builder.Services.AddControllers();
// To make components to do http calls
builder.Services.AddHttpClient();
// To add sqlite suppoort
builder.Services.AddSqlite<PizzaStoreContext>("Data Source=pizza.db");

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
  app.UseExceptionHandler("/Error", createScopeForErrors: true);
  // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
  app.UseHsts();
}

app.UseHttpsRedirection();

app.UseStaticFiles();
app.UseAntiforgery();

app.MapRazorComponents<App>()
	.AddInteractiveServerRenderMode();

// app.MapControllerRoute("default", "{controller=Home}/{action=Index}/{id?}");
app.MapControllers();

// Just to seed initial data
var scopeFactory = app.Services.GetRequiredService<IServiceScopeFactory>();
using (var scope = scopeFactory.CreateScope())
{
  var db = scope.ServiceProvider.GetRequiredService<PizzaStoreContext>();
  if (db.Database.EnsureCreated())
  {
	SeedData.Initialize(db);
  }
}

app.Run();
