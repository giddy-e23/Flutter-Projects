part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}
class CartInitialEvent  extends CartEvent {}
class DeleteCartProductEvent extends CartEvent {
  final ProductsDataModel deletedCartProduct;

  DeleteCartProductEvent({required this.deletedCartProduct});
}