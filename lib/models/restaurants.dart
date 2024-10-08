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
    description: "Vegetarian burger with a cheesy patty, lettuce, and tomato",
    imagePath: "lib/food_app_images/Burgers/burger1.jpg",
    price: 219,
    category: FoodCategory.burgers,
    availableAddons: [
      Addons(name: "Extra Cheese", price: 29),
      Addons(name: "Extra Patty", price: 59),
      Addons(name: "Extra Sauce", price: 59),
    ],
  ),
  Food(
    name: "Big Paneer Burger",
    description: "Vegetarian burger with a paneer patty, lettuce, and special sauce",
    imagePath: "lib/food_app_images/Burgers/burger2.jpg",
    price: 309,
    category: FoodCategory.burgers,
    availableAddons: [
      Addons(name: "Extra Cheese", price: 29),
      Addons(name: "Extra Paneer Patty", price: 59),
      Addons(name: "Extra Sauce", price: 59),
    ],
  ),
  Food(
    name: "Grilled Maharaja Burger",
    description: "Vegetarian burger with double paneer patties and special sauce",
    imagePath: "lib/food_app_images/Burgers/burger3.jpg",
    price: 289,
    category: FoodCategory.burgers,
    availableAddons: [
      Addons(name: "Extra Cheese", price: 29),
      Addons(name: "Extra Paneer Patty", price: 59),
      Addons(name: "Extra Sauce", price: 59),
    ],
  ),
  Food(
    name: "Saucy Burst Burger",
    description: "Vegetarian burger with a saucy chickpea patty and burst filling",
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
    name: "Pseudo Sandwich Burger",
    description: "Vegetarian burger with a crispy veggie patty and special sauce",
    imagePath: "lib/food_app_images/Burgers/burger5.jpg",
    price: 289,
    category: FoodCategory.burgers,
    availableAddons: [
      Addons(name: "Extra Cheese", price: 29),
      Addons(name: "Extra Patty", price: 59),
      Addons(name: "Extra Sauce", price: 59),
    ],
  ),

  // Salads
  Food(
    name: "Whole Protein Salad",
    description: "Fresh salad with high protein ingredients",
    imagePath: "lib/food_app_images/Salads/salad1.jpeg",
    price: 325,
    category: FoodCategory.salads,
    availableAddons: [
      Addons(name: "Extra Cheese", price: 29),
      Addons(name: "Extra Protein", price: 59),
      Addons(name: "Extra Dressing", price: 59),
    ],
  ),
  Food(
    name: "Paneer Tikka Salad",
    description: "Refreshing salad with paneer tikka pieces",
    imagePath: "lib/food_app_images/Salads/salad2.jpeg",
    price: 349,
    category: FoodCategory.salads,
    availableAddons: [
      Addons(name: "Extra Cheese", price: 29),
      Addons(name: "Extra Paneer", price: 59),
      Addons(name: "Extra Dressing", price: 59),
    ],
  ),
  Food(
    name: "Hot n Spicy Salad",
    description: "Spicy salad with fresh vegetables and spicy dressing",
    imagePath: "lib/food_app_images/Salads/salad3.jpeg",
    price: 289,
    category: FoodCategory.salads,
    availableAddons: [
      Addons(name: "Extra Cheese", price: 29),
      Addons(name: "Extra Spices", price: 59),
      Addons(name: "Extra Dressing", price: 59),
    ],
  ),
  Food(
    name: "Only Veggies Salad",
    description: "Simple and fresh salad with assorted veggies",
    imagePath: "lib/food_app_images/Salads/salad4.jpeg",
    price: 209,
    category: FoodCategory.salads,
    availableAddons: [
      Addons(name: "Extra Cheese", price: 29),
      Addons(name: "Extra Seasoning", price: 59),
      Addons(name: "Extra Dressing", price: 59),
    ],
  ),
  Food(
    name: "Peas and Nut Salad",
    description: "Healthy salad with peas and nuts",
    imagePath: "lib/food_app_images/Salads/salad5.jpeg",
    price: 169,
    category: FoodCategory.salads,
    availableAddons: [
      Addons(name: "Extra Cheese", price: 29),
      Addons(name: "Extra Nuts", price: 59),
      Addons(name: "Extra Dressing", price: 59),
    ],
  ),

  // Sides
  Food(
    name: "French Fries",
    description: "Crispy fries served hot",
    imagePath: "lib/food_app_images/Sides/side1.jpeg",
    price: 129,
    category: FoodCategory.sides,
    availableAddons: [
      Addons(name: "Extra Cheese", price: 29),
      Addons(name: "Extra Sauce", price: 59),
      Addons(name: "Extra Seasoning", price: 59),
    ],
  ),
  Food(
    name: "Crunchy Nachos",
    description: "Crunchy nachos with cheese and jalapenos",
    imagePath: "lib/food_app_images/Sides/side2.jpeg",
    price: 129,
    category: FoodCategory.sides,
    availableAddons: [
      Addons(name: "Extra Cheese", price: 29),
      Addons(name: "Extra Jalapenos", price: 59),
      Addons(name: "Extra Sauce", price: 59),
    ],
  ),
  Food(
    name: "Onion Rings",
    description: "Crispy fried onion rings",
    imagePath: "lib/food_app_images/Sides/side3.jpeg",
    price: 149,
    category: FoodCategory.sides,
    availableAddons: [
      Addons(name: "Extra Cheese", price: 29),
      Addons(name: "Extra Sauce", price: 59),
      Addons(name: "Extra Seasoning", price: 59),
    ],
  ),

  // Cakes
  Food(
    name: "Cheesecake",
    description: "Creamy cheesecake with a crumbly base",
    imagePath: "lib/food_app_images/Cakes/cake1.jpeg",
    price: 229,
    category: FoodCategory.cakes,
    availableAddons: [
      Addons(name: "Extra Cream", price: 29),
      Addons(name: "Extra Toppings", price: 59),
      Addons(name: "Extra Sauce", price: 59),
    ],
  ),
  Food(
    name: "Muffins and Brownies",
    description: "Assorted muffins and fudgy brownies",
    imagePath: "lib/food_app_images/Cakes/cake2.jpeg",
    price: 119,
    category: FoodCategory.cakes,
    availableAddons: [
      Addons(name: "Extra Cream", price: 29),
      Addons(name: "Extra Toppings", price: 59),
      Addons(name: "Extra Sauce", price: 59),
    ],
  ),

  // Drinks
  Food(
    name: "Double Choco Chip",
    description: "Choco chip cookie with double chocolate filling",
    imagePath: "lib/food_app_images/Drinks/drink1.jpeg",
    price: 119,
    category: FoodCategory.drinks,
    availableAddons: [
      Addons(name: "Extra Chocolate", price: 29),
      Addons(name: "Extra Milk", price: 59),
      Addons(name: "Extra Cream", price: 59),
    ],
  ),
  Food(
    name: "Soda Lemonade",
    description: "Refreshing lemonade with soda",
    imagePath: "lib/food_app_images/Drinks/drink2.jpeg",
    price: 119,
    category: FoodCategory.drinks,
    availableAddons: [
      Addons(name: "Extra Lemon", price: 29),
      Addons(name: "Extra Soda", price: 59),
      Addons(name: "Extra Ice", price: 59),
    ],
  ),
  Food(
    name: "Coffee",
    description: "Hot coffee brewed to perfection",
    imagePath: "lib/food_app_images/Drinks/drink3.jpeg",
    price: 119,
    category: FoodCategory.drinks,
    availableAddons: [
      Addons(name: "Extra Milk", price: 29),
      Addons(name: "Extra Cream", price: 39),
      Addons(name: "Extra Sugar", price: 09),
  ]),];
  /* G E T T E R S */
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  /* O P E R A T I O N S */
  //user cart
  final List<CartItem> _cart = [];

  //add to cart
  void addToCart(Food food, List<Addons> selectedAddons) {
    // Check if the item already exists in the cart
    CartItem? existingCartItem = _cart.firstWhereOrNull((item) =>
        item.food == food &&
        const ListEquality().equals(item.selectedAddons, selectedAddons));

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

  /* H E L P E R S */
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
