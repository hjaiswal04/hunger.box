import 'package:flutter/material.dart';
import 'package:food_app/components/my_button.dart';
import 'package:food_app/components/my_cart_tile.dart';
import 'package:food_app/models/restaurants.dart';
import 'package:food_app/pages/payement_page.dart'; // Ensure this matches the actual file name
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key}); // Removed the redundant Key? key parameter

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurants>(
      builder: (context, restaurants, child) {
        final userCart = restaurants.cart;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Cart"),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Clear Cart"),
                      content: const Text(
                          "Are you sure you want to clear the cart?"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            restaurants.clearCart();
                            Navigator.pop(context);
                          },
                          child: const Text('Yes'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          body: Column(
            children: [
              // List of cart items
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty
                        ? const Expanded(
                            child: Center(
                              child: Text(
                                "Your cart is empty",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                final cartItem = userCart[index];
                                return MyCartTile(cartItem: cartItem);
                              },
                            ),
                          ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total: ₹ ${restaurants.getTotalPrice().toString()}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16, // Reduced font size
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Button to pay
              MyButton(
                text: "Go to Checkout",
                onTap: () {
                  if (userCart.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Cart is empty"),
                        content: const Text(
                            "You cannot proceed to checkout with an empty cart."),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentPage(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
