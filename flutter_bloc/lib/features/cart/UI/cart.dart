import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_bloc.dart';
import 'cartTileWidget.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    // TODO: implement initState
    cartBloc.add(CartInitialEvent());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Cart'),),
        body: BlocConsumer<CartBloc, CartState>(
          bloc: cartBloc,
          listenWhen: (previous,current) => current is CartActionState,
          buildWhen: (previous,current) => current is !CartActionState,
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            switch(state.runtimeType) {
              case CartLoadedState:
                final cartState = state as CartLoadedState;
                return Scaffold(
                body: ListView.builder(itemCount:cartState.cartedItems.length,itemBuilder: (context,index) {
                  return CartTileWidget(cartedItems: cartState.cartedItems[index], cartBloc: cartBloc, removeIcon: Icon(CupertinoIcons.delete_solid));
                }),);
              default: return Center(child: Text('Cart Empty'),)  ;
            }
          },
        ));
  }
}


