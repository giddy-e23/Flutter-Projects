import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_grocery/features/home/models/products_data_model.dart';

import '../../home/bloc/home_bloc.dart';
import '../bloc/cart_bloc.dart';

class CartTileWidget extends StatelessWidget {
  CartTileWidget({super.key, required this.cartedItems, required this.cartBloc, required this.removeIcon});
  final ProductsDataModel cartedItems ;
  final CartBloc cartBloc;
  final Icon removeIcon;


  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.white10,blurRadius: 3,spreadRadius: 3)],
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(10)),

      ),

      child: Column(children: [
        Container(
          height: 200,
          width: double.maxFinite,
          decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(cartedItems.imageUrl),fit: BoxFit.cover)),

        ),
        Row(mainAxisAlignment: MainAxisAlignment.start,children: [ Text(cartedItems.name,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)]),
        Row(mainAxisAlignment: MainAxisAlignment.start,children: [  Text(cartedItems.description,style: TextStyle(color:Colors.grey,fontSize: 16),),
        ],),
        Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [

            Text("\$ "+cartedItems.price.toString(),
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Row(children: [ IconButton(
              onPressed: () {
            cartBloc.add(DeleteCartProductEvent(deletedCartProduct: cartedItems));

              }, icon: removeIcon,
            ),
              ],)
          ],)


      ],),);
  }
}
