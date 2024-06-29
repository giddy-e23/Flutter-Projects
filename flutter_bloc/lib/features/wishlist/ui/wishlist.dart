import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_grocery/features/home/ui/productsTileWidget.dart';
import 'package:flutter_bloc_grocery/features/wishlist/ui/wishListTileWidget.dart';

import '../bloc/wishlist_bloc.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistLoadedState:
              final successState = state as WishlistLoadedState;

              return Scaffold(
                  appBar: AppBar(
                    title: Text('Wishlist'),
                  ),
                  body: ListView.builder(
                      itemCount: successState.wishlist.length,
                      itemBuilder: (context, index) {
                        return WishlistTileWidget(
                          cartIcon: Icon(CupertinoIcons.cart),
                          wishlistedItems: successState.wishlist[index],
                          removeIcon: Icon(CupertinoIcons.delete_solid),
                          wishlistBloc: wishlistBloc,
                        );
                      }));
            default:
              return Center(
                child: Text('WISHLIST'),
              );
          }
        });
  }
}
