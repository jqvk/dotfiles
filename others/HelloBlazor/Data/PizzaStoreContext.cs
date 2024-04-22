using Microsoft.EntityFrameworkCore;
using HelloBlazor.Model;
namespace HelloBlazor.Data;

public class PizzaStoreContext : DbContext
{
  public PizzaStoreContext(DbContextOptions<PizzaStoreContext> options) : base(options) { }

  public DbSet<Order> Orders { get; set; } = null!;
  public DbSet<Pizza> Pizzas { get; set; } = null!;
  public DbSet<PizzaSpecial> Specials { get; set; } = null!;
  public DbSet<Topping> Toppings { get; set; } = null!;

  protected override void OnModelCreating(ModelBuilder modelBuilder)
  {
    base.OnModelCreating(modelBuilder);

    modelBuilder.Entity<PizzaTopping>().HasKey(pst => new { pst.PizzaId, pst.ToppingId });
    modelBuilder.Entity<PizzaTopping>().HasOne<Pizza>().WithMany(ps => ps.Toppings);
    modelBuilder.Entity<PizzaTopping>().HasOne(pst => pst.Topping).WithMany();
  }
}
