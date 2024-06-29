import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_grocery/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_grocery/features/home/models/products_data_model.dart';

import '../../wishlist/bloc/wishlist_bloc.dart';

class ProductsTileWidget extends StatefulWidget {
   ProductsTileWidget({super.key, required this.productsDataModel, required this.wishlistBloc, required this.wishListIcon, required this.cartIcon});
  final ProductsDataModel productsDataModel ;
  final HomeBloc wishlistBloc;
  Icon wishListIcon;
  Icon cartIcon;

  @override
  State<ProductsTileWidget> createState() => _ProductsTileWidgetState();
}

class _ProductsTileWidgetState extends State<ProductsTileWidget> {

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
        decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(widget.productsDataModel.imageUrl),fit: BoxFit.cover)),

      ),
       Row(mainAxisAlignment: MainAxisAlignment.start,children: [ Text(widget.productsDataModel.name,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)]),
       Row(mainAxisAlignment: MainAxisAlignment.start,children: [  Text(widget.productsDataModel.description,style: TextStyle(color:Colors.grey,fontSize: 16),),
        ],),
        Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [

          Text("\$ "+widget.productsDataModel.price.toString(),
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          Row(children: [ IconButton(
            onPressed: () {
              widget.wishlistBloc.add(HomeProductWishlistButtonClickedEvent(clickedProduct: widget.productsDataModel));
              widget.wishlistBloc.add(LikedEvent(likedProduct: widget.productsDataModel.id));
              // setState(() {
              //   widget.wishListIcon = Icon(CupertinoIcons.heart_fill);
              // });
            }, icon: widget.wishListIcon,
          ),
            IconButton(
              onPressed: () {
            widget.wishlistBloc.add(HomeProductCartButtonClickedEvent(clickedProduct: widget.productsDataModel));
            setState(() {
              widget.cartIcon = Icon(CupertinoIcons.cart_fill);
            });

              }, icon: widget.cartIcon,
            ),],)
        ],)


    ],),);
  }
}
