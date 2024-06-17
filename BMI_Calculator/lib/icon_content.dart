import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'constants.dart';


class GenderCard extends ReusableCard {
  final fontAwesomeIcon;
  String gender;
  GenderCard({required super.colour,required this.fontAwesomeIcon, required this.gender});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      width: 170.0,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: colour,

          //  Color(containerColorValue),
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [ Icon(fontAwesomeIcon,
          size: 68.0,
        ),
          const SizedBox(height: 15.0,),
          Text(gender,
            style:kLabelTextStyle,)

        ],

      ),
    );
  }
}