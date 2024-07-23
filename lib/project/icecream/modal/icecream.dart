class IcecreamData {
  List<Icecream> icecreams;

  IcecreamData({
    required this.icecreams,
  });
}

class Icecream {
  List<String>? toppings;
  List<Ingredient>? ingredients;
  String name;
  String? image;
  int price;
  String? description;

  Icecream({
    this.toppings,
    this.ingredients,
    required this.name,
    this.image,
    required this.price,
    this.description,
  });
}

class Ingredient {
  String name;
  String quantity;

  Ingredient({
    required this.name,
    required this.quantity,
  });
}
