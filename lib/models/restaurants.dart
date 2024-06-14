import 'package:flutter/foundation.dart';
import 'package:food_app/models/food.dart';
import 'package:food_app/models/cart.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';


class Restaurants extends ChangeNotifier {
  //list of food menu

  final List<Food> _menu = [
    //burgers
    Food(
      name: "Classic Cheeseburger",
      description: "The Classic Cheese Burger with an Indian twist",
      imagePath: "lib/food_app_images/Burgers/burger1.jpg",
      price: 219.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addons(name: "Extra Cheese", price: 29),
        Addons(name: "Extra Patty", price: 59),
        Addons(name: "Extra Sauce", price: 59),
      ],
    ),
    Food(
      name: "Big Paneer Burger",
      description: "The Classic Cheese Burger with an Indian twist",
      imagePath: "lib/food_app_images/Burgers/burger2.jpg",
      price: 309,
      category: FoodCategory.burgers,
      availableAddons: [
        Addons(name: "Extra Cheese", price: 29),
        Addons(name: "Extra Patty", price: 59),
        Addons(name: "Extra Sauce", price: 59),
      ],
    ),
    Food(
      name: "Grilled Maharaja",
      description: "The Classic Cheese Burger with an Indian twist",
      imagePath: "lib/food_app_images/Burgers/burger3.jpg",
      price: 289,
      category: FoodCategory.burgers,
      availableAddons: [
        Addons(name: "Extra Cheese", price: 29),
        Addons(name: "Extra Patty", price: 59),
        Addons(name: "Extra Sauce", price: 59),
      ],
    ),
    Food(
      name: "Saucy Burst",
      description: "The Classic Cheese Burger with an Indian twist",
      imagePath: "lib/food_app_images/Burgers/burger4.jpg",
      price: 179,
      category: FoodCategory.burgers,
      availableAddons: [
        Addons(name: "Extra Cheese", price: 29),
        Addons(name: "Extra Patty", price: 59),
        Addons(name: "Extra Sauce", price: 59),
      ],
    ),
    Food(
      name: "Pseudo Sandwich",
      description: "The Classic Cheese Burger with an Indian twist",
      imagePath: "lib/food_app_images/Burgers/burger5.jpg",
      price: 289,
      category: FoodCategory.burgers,
      availableAddons: [
        Addons(name: "Extra Cheese", price: 29),
        Addons(name: "Extra Patty", price: 59),
        Addons(name: "Extra Sauce", price: 59),
      ],
    ),

    //salads
    Food(
      name: "Whole Protein Salad",
      description: "ANY",
      imagePath: "lib/food_app_images/Salads/salad1.jpeg",
      price: 325,
      category: FoodCategory.salads,
      availableAddons: [
        Addons(name: "Extra Cheese", price: 29),
        Addons(name: "Extra Patty", price: 59),
        Addons(name: "Extra Sauce", price: 59),
      ],
    ),
    Food(
      name: " Paneer Salad",
      description: "ANY",
      imagePath: "lib/food_app_images/Salads/salad2.jpeg",
      price: 349,
      category: FoodCategory.salads,
      availableAddons: [
        Addons(name: "Extra Cheese", price: 29),
        Addons(name: "Extra Patty", price: 59),
        Addons(name: "Extra Sauce", price: 59),
      ],
    ),
    Food(
      name: "The Hot n Spicy Salad",
      description: "ANY",
      imagePath: "lib/food_app_images/Salads/salad3.jpeg",
      price: 289,
      category: FoodCategory.salads,
      availableAddons: [
        Addons(name: "Extra Cheese", price: 29),
        Addons(name: "Extra Patty", price: 59),
        Addons(name: "Extra Sauce", price: 59),
      ],
    ),
    Food(
      name: "Only Veggies",
      description: "ANY",
      imagePath: "lib/food_app_images/Salads/salad4.jpeg",
      price: 209,
      category: FoodCategory.salads,
      availableAddons: [
        Addons(name: "Extra Cheese", price: 29),
        Addons(name: "Extra Patty", price: 59),
        Addons(name: "Extra Sauce", price: 59),
      ],
    ),
    Food(
      name: "Peas and Nut Salad",
      description: "ANY",
      imagePath: "lib/food_app_images/Salads/salad5.jpeg",
      price: 169,
      category: FoodCategory.salads,
      availableAddons: [
        Addons(name: "Extra Cheese", price: 29),
        Addons(name: "Extra Patty", price: 59),
        Addons(name: "Extra Sauce", price: 59),
      ],
    ),

    //sides
    Food(
      name: "FrenchFries",
      description: "ANY",
      imagePath: "lib/food_app_images/Sides/side1.jpeg",
      price: 129,
      category: FoodCategory.sides,
      availableAddons: [
        Addons(name: "Extra Cheese", price: 29),
        Addons(name: "Extra Patty", price: 59),
        Addons(name: "Extra Sauce", price: 59),
      ],
    ),
    Food(
      name: "Crunchy Nachos",
      description: "ANY",
      imagePath: "lib/food_app_images/Sides/side2.jpeg",
      price: 129,
      category: FoodCategory.sides,
      availableAddons: [
        Addons(name: "Extra Cheese", price: 29),
        Addons(name: "Extra Patty", price: 59),
        Addons(name: "Extra Sauce", price: 59),
      ],
    ),
    Food(
      name: "Onion Rings",
      description: "ANY",
      imagePath: "lib/food_app_images/Sides/side3.jpeg",
      price: 149,
      category: FoodCategory.sides,
      availableAddons: [
        Addons(name: "Extra Cheese", price: 29),
        Addons(name: "Extra Patty", price: 59),
        Addons(name: "Extra Sauce", price: 59),
      ],
    ),
    //cakes
    Food(
      name: "Cheese Cake",
      description: "ANY",
      imagePath: "lib/food_app_images/Cakes/cake1.jpeg",
      price: 229,
      category: FoodCategory.cakes,
      availableAddons: [
        Addons(name: "Extra Cheese", price: 29),
        Addons(name: "Extra Patty", price: 59),
        Addons(name: "Extra Sauce", price: 59),
      ],
    ),
    Food(
      name: "Muffins and Brownies",
      description: "ANY",
      imagePath: "lib/food_app_images/Cakes/cake2.jpeg",
      price: 119,
      category: FoodCategory.cakes,
      availableAddons: [
        Addons(name: "Extra Cheese", price: 29),
        Addons(name: "Extra Patty", price: 59),
        Addons(name: "Extra Sauce", price: 59),
      ],
    ),

    //drinks
    Food(
      name: "Double Choco Chip",
      description: "ANY",
      imagePath: "lib/food_app_images/Drinks/drink1.jpeg",
      price: 119,
      category: FoodCategory.drinks,
      availableAddons: [
        Addons(name: "Extra Cheese", price: 29),
        Addons(name: "Extra Patty", price: 59),
        Addons(name: "Extra Sauce", price: 59),
      ],
    ),
    Food(
      name: "Soda Lemonade",
      description: "ANY",
      imagePath: "lib/food_app_images/Drinks/drink2.jpeg",
      price: 119,
      category: FoodCategory.drinks,
      availableAddons: [
        Addons(name: "Extra Cheese", price: 29),
        Addons(name: "Extra Patty", price: 59),
        Addons(name: "Extra Sauce", price: 59),
      ],
    ),
    Food(
      name: "Coffee",
      description: "ANY",
      imagePath: "lib/food_app_images/Drinks/drinks3.jpeg",
      price: 119,
      category: FoodCategory.drinks,
      availableAddons: [
        Addons(name: "Extra Cheese", price: 29),
        Addons(name: "Extra Patty", price: 59),
        Addons(name: "Extra Sauce", price: 59),
      ],
    ),
  ];
  /*
  
  G E T T E R S
  */
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  /*
  
  O P E R A T I O N S 
  */
  //user cart

  final List<CartItem> _cart = [];
  //add to cart
  void addToCart(Food food, List<Addons> selectedAddons) {
    // Check if the item already exists in the cart
    CartItem? existingCartItem = _cart.firstWhereOrNull((item) =>
        item.food == food &&
        ListEquality().equals(item.selectedAddons, selectedAddons));

    if (existingCartItem != null) {
      // If the item exists, increase its quantity
      existingCartItem.quantity++;
    } else {
      // If the item doesn't exist, add it to the cart
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }

    // Notify listeners after updating the cart
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // get total price of cart
  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addons addons in cartItem.selectedAddons) {
        itemTotal += addons.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  // Total items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  //Clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  /*
  H E L P E R S
  */
   String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt");
    receipt.writeln("");

    // Format the date to include up to seconds
    String formattedDate = DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln("");
    receipt.writeln("---------------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln("");
    }

    receipt.writeln("---------------");
    receipt.writeln("");
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");

    return receipt.toString();
  }

  // Format double into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  // Format list of addons into string summary
  String _formatAddons(List<Addons> addons) {
    return addons
        .map((addon) => '${addon.name}: ₹${addon.price.toStringAsFixed(2)}')
        .join(', ');
  }


}
