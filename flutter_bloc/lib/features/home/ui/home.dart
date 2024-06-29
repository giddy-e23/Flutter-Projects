import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_grocery/features/cart/UI/cart.dart';
import 'package:flutter_bloc_grocery/features/home/ui/productsTileWidget.dart';
import 'package:flutter_bloc_grocery/features/wishlist/ui/wishlist.dart';

import '../bloc/home_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Icon wishListIcon = Icon(CupertinoIcons.heart);

  final HomeBloc homeBloc = HomeBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeBloc.add(HomeInitialEvent());
  }
  @override

  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listener: (context, state) {
        if(state is HomeNavigateToCartPageActionState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
        }
        else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Wishlist()));
        }
        else if (state is HomeCartAddedState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item added to Cart!!')));
        }
        else if (state is HomeWishListAddedState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item added to WishList!!')));
        }
        else if (state is LikedActionState){

          setState(() {
            wishListIcon = Icon(CupertinoIcons.heart_fill);
          });}

          else if (state is AlreadyLikedActionState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item already added to cart')));
        }


      },
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is !HomeActionState,
      builder: (context, state) {

        switch(state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(child: CircularProgressIndicator(),),
            );

          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;

            return Scaffold(
              appBar: AppBar(
                title: Text('Grocery App'),
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeWishlistButtonNavigateEvent());
                    }, icon: Icon(CupertinoIcons.heart_fill),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeCartButtonNavigateEvent());
                    }, icon: Icon(CupertinoIcons.cart),
                  ),
                ],
              ),
              body: ListView.builder(
                  itemCount:successState.products.length,
        itemBuilder: (context,index) {

                return ProductsTileWidget(productsDataModel: successState.products[index], wishlistBloc: homeBloc ,wishListIcon: wishListIcon, cartIcon: Icon(CupertinoIcons.cart),);
              })
            );

          case HomeErrorState:
            return Scaffold(body: Text('ERROR'),);

          case HomeCartClikedState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
                appBar: AppBar(
                  title: Text('Grocery App'),
                  actions: [
                    IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishlistButtonNavigateEvent());
                      }, icon: Icon(CupertinoIcons.heart_solid),
                    ),
                    IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartButtonNavigateEvent());
                      }, icon: Icon(CupertinoIcons.cart),
                    ),
                  ],
                ),
                body: ListView.builder(
                    itemCount:successState.products.length,
                    itemBuilder: (context,index) {

                      return ProductsTileWidget(productsDataModel: successState.products[index], wishlistBloc: homeBloc ,wishListIcon: Icon(CupertinoIcons.heart_fill,color: Colors.red,),cartIcon: Icon(CupertinoIcons.cart_fill),);
                    })
            );


          default:
            return Scaffold(body: Center(child:Text("DEFAULT PAGE")),);



        }

      },
    );
  }
}
