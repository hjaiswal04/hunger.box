import 'package:flutter/material.dart';
import 'package:food_app/components/my_receipt.dart';
import 'package:food_app/models/restaurants.dart';
import 'package:food_app/services/auth/database/firestore.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  FirestoreService db = FirestoreService();

  @override
  void initState() {
    super.initState();
    String receipt = context.read<Restaurants>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delivery in Progress..."),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            MyReceipt(),
            // Add more widgets here if needed
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 90, // Adjusted height
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Adjusted padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 50, // Adjusted width
            height: 50, // Adjusted height
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
            ),
          ),
          const SizedBox(width: 10), // Added spacing
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Delivery Man 1",
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
          // Message button with hover effect and dialog
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Message Driver"),
                  content: const Text("Are you sure you want to message the driver?"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        // Add functionality to message driver
                        Navigator.pop(context);
                      },
                      child: const Text("Message"),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.message),
            color: Theme.of(context).colorScheme.surface,
            hoverColor: Colors.blueGrey[200], // Adjust hover color
          ),
          // Call button with hover effect and dialog
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Call Driver"),
                  content: const Text("Are you sure you want to call the driver?"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        // Add functionality to call driver
                        Navigator.pop(context);
                      },
                      child: const Text("Call"),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.call),
            color: Theme.of(context).colorScheme.surface,
            hoverColor: Colors.blueGrey[200], // Adjust hover color
          ),
        ],
      ),
    );
  }
}
