import 'package:flutter/material.dart';
import 'package:food_app/components/my_quantity_selector.dart';
import 'package:food_app/models/cart.dart';
import 'package:food_app/models/restaurants.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurants>(
      builder: (context, restaurants, child) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        cartItem.food.imagePath,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cartItem.food.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '₹${cartItem.food.price.toString()}',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    MyQuantitySelector(
                      quantity: cartItem.quantity,
                      food: cartItem.food,
                      onDecrement: () =>
                          restaurants.removeFromCart(cartItem),
                      onIncrement: () => restaurants.addToCart(
                          cartItem.food, cartItem.selectedAddons),
                    ),
                  ],
                ),
              ),
              // Addons can be displayed here
              SizedBox(
                height: cartItem.selectedAddons.isEmpty ? 0 : 60,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: cartItem.selectedAddons.map((addon) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Chip(
                          label: Row(
                            children: [
                              Text(addon.name),
                              const SizedBox(width: 4),
                              Text(
                                '(₹${addon.price.toStringAsFixed(2)})',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                              ),
                            ],
                          ),
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.1),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              )
            ], 
          ),
        );
      },
    );
  }
}