namespace HelloBlazor.Model;

using System.ComponentModel.DataAnnotations;

public class Address
{
    public int Id { get; set; }

		[Required, MinLength(3, ErrorMessage="Name must be at least 3 characters"), MaxLength(100, ErrorMessage="Name must be at most 100 characters")]
    public string? Name { get; set; }
		[Required, MinLength(5), MaxLength(100)]
    public string? Line1 { get; set; }
		[MaxLength(100)]
    public string? Line2 { get; set; }
		[Required, MinLength(3), MaxLength(50)]
    public string? City { get; set; }
		[Required, MinLength(3), MaxLength(20)]
    public string? Region { get; set; }
		[Required, RegularExpression(@"^([0-9]{5})$", ErrorMessage="Postal code must be 5 digits")]
    public string? PostalCode { get; set; }

		public override string ToString() => $"Address: Name{Name}, Line1{Line1}, Line2{Line2}, City{City}, Region{Region}, PostalCode{PostalCode}";
}

public class UserInfo
{
    public bool IsAuthenticated { get; set; }
    public string? Name { get; set; }
}

public class Topping
{
    public int Id { get; set; }
    public string? Name { get; set; }
    public decimal Price { get; set; }
    public string? GetFormattedPrice() => Price.ToString("0.00");
}

public class PizzaSpecial
{
    public int Id { get; set; }
    public string? Name { get; set; }
    public decimal BasePrice { get; set; }
    public string? Description { get; set; }
    public string? ImageUrl { get; set; }
    public string GetFormattedBasePrice() => BasePrice.ToString("0.00");
}

public class PizzaTopping
{
    public Topping? Topping { get; set; }
    public int ToppingId { get; set; }
    public int PizzaId { get; set; }
}

public class Pizza
{
    public const int DefaultSize = 12;
    public const int MinimumSize = 9;
    public const int MaximumSize = 17;

    public int Id { get; set; }
    public int OrderId { get; set; }
    public PizzaSpecial? Special { get; set; }
    public int SpecialId { get; set; }
    public int Size { get; set; }
    public List<PizzaTopping> Toppings { get; set; } = new();

    public decimal GetBasePrice()
    {
				if (Special == null) return 0;
        return ((decimal)Size / (decimal)DefaultSize) * Special.BasePrice;
    }

    public decimal GetTotalPrice() => GetBasePrice();
    public string GetFormattedTotalPrice() => GetTotalPrice().ToString("0.00");
}

public class Order
{
    public int OrderId { get; set; }
    public string? UserId { get; set; }
    public DateTime CreatedTime { get; set; }
    public Address? DeliveryAddress { get; set; }
    public List<Pizza> Pizzas { get; set; } = new();
    public decimal GetTotalPrice() => Pizzas.Sum(p => p.GetTotalPrice());
    public string GetFormattedTotalPrice() => GetTotalPrice().ToString("0.00");
}

public class OrderWithStatus
{
    public readonly static TimeSpan PreparationDuration = TimeSpan.FromSeconds(10);
    public readonly static TimeSpan DeliveryDuration = TimeSpan.FromMinutes(1);

    public Order Order { get; set; } = new();
    public string? StatusText { get; set; }
    public bool IsDelivered => StatusText == "Delivered";
    public static OrderWithStatus FromOrder(Order order)
    {
        string statusText = "";
        var dispatchTime = order.CreatedTime.Add(PreparationDuration);
        if (DateTime.Now < dispatchTime)
        {
            statusText = "Preparing";
        }
        else if (DateTime.Now < dispatchTime + DeliveryDuration)
        {
            statusText = "Out for delivery";
        }
        else {
            statusText = "Delivered";
        }

        return new OrderWithStatus{Order = order, StatusText = statusText};
    }
};
