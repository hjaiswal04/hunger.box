import 'package:flutter/material.dart';
import 'package:food_app/components/my_button.dart';
import 'package:food_app/models/food.dart';
import 'package:food_app/models/cart.dart';
import 'package:food_app/models/restaurants.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';
import 'package:geocoding/geocoding.dart';

class FoodPage extends StatefulWidget {
  final Food food;

  FoodPage({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  late Map<Addons, bool> _selectedAddons;

  void addToCart(Food food, Map<Addons, bool> selectedAddons) {
    Navigator.pop(context);
    List<Addons> currentlySelectedAddons = [];
    for (Addons addon in selectedAddons.keys) {
      if (selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }
    context.read<Restaurants>().addToCart(food, currentlySelectedAddons);
  }

  @override
  void initState() {
    super.initState();
    _selectedAddons = {
      for (var addon in widget.food.availableAddons) addon: false
    };
  }

  void _onAddonChanged(Addons addon, bool? value) {
    setState(() {
      _selectedAddons[addon] = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Scaffold
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                // Food image
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Container(
                    //width: 300,
                    //height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: Image.asset(
                        widget.food.imagePath,
                        //width: 300,
                        //height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Food name
                      Text(
                        widget.food.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      // Food price
                      Text(
                        '\₹ ${widget.food.price.toString()}',
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      // Food description
                      Text(
                        widget.food.description,
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      const SizedBox(height: 10),
                      Divider(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(height: 10),
                      // Addons
                      Text(
                        "Add-ons",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: widget.food.availableAddons.length,
                          itemBuilder: (context, index) {
                            // Get individual addon
                            Addons addon = widget.food.availableAddons[index];
                            return CheckboxListTile(
                              title: Text(addon.name),
                              subtitle: Text('\₹ ${addon.price.toString()}'),
                              value: _selectedAddons[addon],
                              onChanged: (value) {
                                _onAddonChanged(addon, value);
                              },
                            );
                          },
                        ),
                      ),
                      // Add to cart button
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: MyButton(
                          text: "Add to cart",
                          onTap: () => addToCart(widget.food, _selectedAddons),
                        ),
                      ),
                      const SizedBox(height: 25, width: 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // Back button
        Positioned(
          top: 15,
          left: 25,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ],
    );
  }
}
