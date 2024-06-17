import 'dart:convert';

import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String bmiValue;
  final String comment;
  final String interpretation;
  ResultsPage({super.key, required this.bmiValue, required this.comment, required this.interpretation});
  Color commentColor() {
    if(comment =='Overweight') {
      return Colors.red;
    }
    else if (comment == 'Normal') {
      return Colors.green;
    }
    else {
      return Colors.blueAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Text(
                'Your Result',
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900),
              )),
          Expanded(
            flex: 6,
            child: Container(
              decoration: BoxDecoration(
                  color: kActiveColorValue,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              margin: EdgeInsets.all(12.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      comment.toUpperCase(),
                      style: TextStyle(
                          fontSize: 20.0,
                          color: commentColor(),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bmiValue.toUpperCase(),
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.w900),
                    ),
                    Text(
                      interpretation,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {Navigator.pop(context);},
              child: Container(
                width: double.infinity,
                height: kBottomContainerHeight,
                color: const Color(0xFFEB1555),
                child: Center(
                    child: Text('RE-CALCULATE', style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
