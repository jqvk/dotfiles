using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using HelloBlazor.Data;
using HelloBlazor.Model;

[Route("specials")]
[ApiController]
public class SpecialsController : Controller
{
  private readonly PizzaStoreContext _db;
  public SpecialsController(PizzaStoreContext db) => _db = db;

  [HttpGet]
  public async Task<ActionResult<List<PizzaSpecial>>> GetSpecials()
  {
		var dbData = await _db.Specials.ToListAsync();
		return dbData.OrderBy(s => s.BasePrice).ToList();
  }
}
