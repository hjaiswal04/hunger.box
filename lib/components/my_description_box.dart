import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    //text style
    var myPrimaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary
    );
    var mySecondaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.primary
    );
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.secondary),
          borderRadius: BorderRadius.circular(8)
          ),
          
      padding: const EdgeInsets.all(25),
      margin:const EdgeInsets.only(left:15,right: 25, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //delivery fee
          Column(
            children: [
              Text('₹16/-',style:  myPrimaryTextStyle,),
              Text('Delivery Fee',style:  myPrimaryTextStyle,),
            ],
          ),
          //delivery time
          Column(
            children: [
              Text('15-30 mins',style:  myPrimaryTextStyle,),
              Text('Delivery Time',style:  mySecondaryTextStyle,),
            ],
          )
        ],
      ),
    );
  }
}
