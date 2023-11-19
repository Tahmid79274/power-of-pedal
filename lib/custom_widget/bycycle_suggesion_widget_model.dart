import 'package:flutter/material.dart';

class BycycleSuggestionWidget extends StatelessWidget {
  final title,distance;
  const BycycleSuggestionWidget({super.key,required this.title,required this.distance,});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(15),
      height: 300,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
          Text(distance,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
        ],),
    );
  }
}
