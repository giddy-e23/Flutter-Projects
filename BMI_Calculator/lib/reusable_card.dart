import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  var cardChild;
  final Color colour;
  ReusableCard({required this.colour,  this.cardChild} );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      height: 320.0,
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width:170.0,
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          color: colour,


          //  Color(containerColorValue),
          borderRadius: BorderRadius.circular(10.0)),
    );
  }
}