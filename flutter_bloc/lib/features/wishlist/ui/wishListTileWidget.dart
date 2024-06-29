//returns the cards for the wishlist
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_grocery/features/home/models/products_data_model.dart';


import '../bloc/wishlist_bloc.dart';

class WishlistTileWidget extends StatelessWidget {
  WishlistTileWidget({super.key, required this.wishlistedItems, required this.wishlistBloc, required this.removeIcon, required this.cartIcon});
  final ProductsDataModel wishlistedItems ;
  final WishlistBloc wishlistBloc;
  final Icon removeIcon;
  final Icon cartIcon;

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
          decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(wishlistedItems.imageUrl),fit: BoxFit.cover)),

        ),
        Row(mainAxisAlignment: MainAxisAlignment.start,children: [ Text(wishlistedItems.name,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)]),
        Row(mainAxisAlignment: MainAxisAlignment.start,children: [  Text(wishlistedItems.description,style: TextStyle(color:Colors.grey,fontSize: 16),),
        ],),
        Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [

            Text("\$ "+wishlistedItems.price.toString(),
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Row(children: [ IconButton(
              onPressed: () {
                // wishlistBloc.add(HomeProductWishlistButtonClickedEvent(clickedProduct: productsDataModel))
                wishlistBloc.add(DeleteWishlistedItemEvent(wishlistedItem: wishlistedItems));
              }, icon: removeIcon,
            ),
              IconButton(
                onPressed: () {
                  wishlistBloc.add(AddToCartEvent(wishlistedItem: wishlistedItems));

                }, icon: cartIcon,
              ),],)
          ],)


      ],),);
  }
}
