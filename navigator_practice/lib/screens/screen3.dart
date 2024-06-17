import 'package:flutter/material.dart';
import 'screen1.dart';


class Screen3 extends StatelessWidget {
  const Screen3({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SCREEN 3"),
      ),
      body: Center(
        child: ElevatedButton(child:Text( 'TO SCREEN 1'),
          onPressed: () {

          },),
      ),
    );
  }
}
