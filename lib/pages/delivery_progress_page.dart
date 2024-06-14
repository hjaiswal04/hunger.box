import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/components/my_receipt.dart';

class DeliveryProgressPage extends StatelessWidget {
  const DeliveryProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delivery in Progress..."),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: Column(
        children: [
          MyReceipt(),
        ],
      ),
    );
  }

  // Custom bottom nav bar / all delivery driver
  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 110, // Increased height
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      padding: EdgeInsets.fromLTRB(0, 25, 25, 50), // Adjusted bottom padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Profile pic of driver
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.person),
            ),
          ),
          // Driver details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Pappu Paan wala",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  Text(
                    "Driver",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Message button
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.message),
            color: Theme.of(context).colorScheme.surface,
          ),
          // Call button
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.call),
            color: Theme.of(context).colorScheme.surface,
          ),
        ],
      ),
    );
  }
}
