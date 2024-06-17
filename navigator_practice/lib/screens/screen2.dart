import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screen3.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SCREEN 2"),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(child:Text( 'TO SCREEN 3'),
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) => Screen3()));
              },),
          ),

        ],
      ),
    );
  }
}