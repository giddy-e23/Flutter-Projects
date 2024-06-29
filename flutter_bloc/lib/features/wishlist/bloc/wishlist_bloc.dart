import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/cart_items.dart';
import '../../../data/wishlist_items.dart';
import '../../home/models/products_data_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
   on<WishlistInitialEvent>(wishlistInitialEvent);
   on<DeleteWishlistedItemEvent>(deleteWishlistedItemEvent);
   on<AddToCartEvent>(addToCartEvent);
  }

  FutureOr<void> wishlistInitialEvent(WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistLoadedState(wishlist: wishList));
  }

  FutureOr<void> deleteWishlistedItemEvent(DeleteWishlistedItemEvent event, Emitter<WishlistState> emit) {
    wishList.remove(event.wishlistedItem);
    emit(WishlistLoadedState(wishlist: wishList));
  }

  FutureOr<void> addToCartEvent(AddToCartEvent event, Emitter<WishlistState> emit) {
    cartList.add(event.wishlistedItem);
    wishList.remove(event.wishlistedItem);
    emit(WishlistLoadedState(wishlist: wishList));
  }
}

