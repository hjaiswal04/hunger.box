import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:food_app/models/restaurants.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 25,),
            const Text("Thank You For your Order"),
            
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.secondary),
                borderRadius: BorderRadius.circular(8),
              ) ,
              padding: const EdgeInsets.all(25),
              child: Consumer<Restaurants>(
                builder:(context,restaurants,child)=> Text(restaurants.displayCartReceipt()),
              )
            ),
            const SizedBox(height: 25,),
            const Text("Estimated Delivery Time is: 15-25 Minutes"),
          ],
        ),
      ),
    );
  }
}
