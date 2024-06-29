import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_grocery/data/cart_items.dart';
import 'package:flutter_bloc_grocery/data/grocery_data.dart';
import 'package:flutter_bloc_grocery/data/wishlist_items.dart';
import 'package:meta/meta.dart';

import '../models/products_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

List <String> productId = [];

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeProductWishlistButtonClickedEvent>(homeProductWishlistButtonClickedEvent);
    on<LikedEvent>(likedEvent);
  }

  FutureOr<void> homeCartButtonNavigateEvent(HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToCartPageActionState());
    print('CART NAVIGATOR CLICKED');
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToWishlistPageActionState());
    print('WISHlIST NAVIGATOR CLICKED');

  }

  FutureOr<void> homeProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    emit(HomeCartClikedState());
      emit(HomeLoadedSuccessState(products: GroceryList.groceryProducts.map((e)=>ProductsDataModel(id: e['id'], name: e['name'], price: e['price'], imageUrl: e['imageUrl'], description: e['description'])).toList()));


    cartList.add(event.clickedProduct);
    print('Cart clicked');
    emit(HomeCartAddedState());
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    emit(HomeWishListClikedState());
    emit(HomeLoadedSuccessState(products: GroceryList.groceryProducts.map((e)=>ProductsDataModel(id: e['id'], name: e['name'], price: e['price'], imageUrl: e['imageUrl'], description: e['description'])).toList()));

    wishList.add(event.clickedProduct);
    print('Wishlist clicked');
    emit(HomeWishListAddedState());
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async{
    emit(HomeLoadingState());
    print('Page Loading');
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(products: GroceryList.groceryProducts.map((e)=>ProductsDataModel(id: e['id'], name: e['name'], price: e['price'], imageUrl: e['imageUrl'], description: e['description'])).toList()));
    print('Page Loaded');

  }

  FutureOr<void> likedEvent(LikedEvent event, Emitter<HomeState> emit) {
    if(!productId.contains(event.likedProduct)) {
  print(event.likedProduct);
       emit(LikedActionState());

    }
    else {
      emit(AlreadyLikedActionState());
    }
  }
}
