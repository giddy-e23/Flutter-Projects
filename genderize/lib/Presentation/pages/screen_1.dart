import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genderize/Presentation/bloc/gender_bloc.dart';
import 'package:genderize/data/repository/gender_repository.dart';
class GenderMain extends StatelessWidget {
  String inputResult = '';
  TextEditingController textEditingController = TextEditingController();
  GenderMain({super.key});
  GenderBloc genderBloc =GenderBloc();

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<GenderBloc, GenderState>(
      bloc: genderBloc,
  builder: (context, state) {
   switch(state.runtimeType) {
     case GenderRevealState :
       final successState = state as GenderRevealState;
       final userGender = successState.genderData.gender;
       final userName = successState.genderData.name;
       final probability = '${successState.genderData.probability*100}%';
       return Scaffold(body: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [Row(children: [Text(inputResult,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold), ),SizedBox(child: Text(' '),),Text('is'),SizedBox(child: Text(' '),),Text(userGender,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),SizedBox(child: Text(' '),),Text('with'),Text(probability ,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),SizedBox(child: Text(' '),),Text('certainty')])]));
     default:
       return  Scaffold(
         appBar: AppBar(title: Text('Genderize'),),
         body: Column(mainAxisAlignment:MainAxisAlignment.center,children: [
           Padding(
             padding: EdgeInsets.symmetric(horizontal: 32.0,vertical: 16.0),
             child: TextField(style:TextStyle(fontSize: 32.0),controller:textEditingController,onChanged: (textInput){
               inputResult = textInput;
               print(inputResult);
             },),
           ),
           ElevatedButton(onPressed: ()async{
           genderBloc.add(GetGenderEvent(name: inputResult));

             print(inputResult);
           }, child: Text('Genderize')),
           ElevatedButton(onPressed: (){textEditingController.clear();}, child: Text('Clear')),
         ],),
       );
   }

  },
);
  }
}
