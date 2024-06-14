// Food class
class Food {
  final String name;
  final String description;
  final double price;
  final String imagePath;
  final FoodCategory category;
  List<Addons> availableAddons;

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });
}

// Food categories
enum FoodCategory {
  burgers,
  salads,
  sides,
  cakes,
  drinks,
}

// Food addons
class Addons {
  String name;
  double price; 

  Addons({
    required this.name,
    required this.price, 
  });
}
