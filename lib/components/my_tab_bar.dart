import 'package:flutter/material.dart';
import 'package:food_app/models/food.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;
  const MyTabBar({super.key, required this.tabController});

  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(controller: tabController, tabs: const [
        //first tab
        Tab(
          text: "Burger",
        ),
        //second tab
        Tab(
          text: "Salads",
        ),
        //third tab
        Tab(
          text: "Sides",
        ),
        Tab(
          text: "Cakes",
        ),
        Tab(
          text: "Drinks",
        ),
      ]),
    );
  }
}
