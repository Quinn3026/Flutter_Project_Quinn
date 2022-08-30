
class CoffeeItems{
String? Name;
String? Type;
String? Calories;
int? Price;
String? Images;

CoffeeItems(
    {
      this.Name,
      this.Type,
      this.Calories,
      this.Price,
      this.Images,
    });
  CoffeeItems.fromJson(Map<String,dynamic> json)
  {
    Name = json['Name'];
    Type = json['Type'];
    Calories = json['Calories'];
    Price = json['Price'];
    Images = json['Images'];
  }

}
