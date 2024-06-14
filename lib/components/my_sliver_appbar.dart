import 'package:flutter/material.dart';
import 'package:food_app/pages/cart_page.dart';

class MySliverAppbar extends StatelessWidget {
  final Widget child;
  final Widget title;
  const MySliverAppbar({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: true,
      pinned: true,
      actions: [
        IconButton(
            onPressed: () {
              //go to the cart page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
            icon: const Icon(Icons.shopping_cart_outlined),
            padding: const EdgeInsets.only(right: 8),)
        //cart button
      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text(
        "The Hunger Box",
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 60),
            child: child),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
