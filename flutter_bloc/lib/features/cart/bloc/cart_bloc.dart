import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_grocery/data/cart_items.dart';
import 'package:flutter_bloc_grocery/features/home/models/products_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
  on<CartInitialEvent> (cartInitialEvent);
  on<DeleteCartProductEvent> (deleteCartProductEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartLoadedState(cartedItems: cartList));
  }

  FutureOr<void> deleteCartProductEvent(DeleteCartProductEvent event, Emitter<CartState> emit) {
    cartList.remove(event.deletedCartProduct);
    emit(CartLoadedState(cartedItems: cartList));
  }
}
