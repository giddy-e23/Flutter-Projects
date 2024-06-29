part of 'cart_bloc.dart';

@immutable
sealed class CartState {}
abstract class CartActionState extends CartState {}

final class CartInitial extends CartState{}
final class CartLoadedState extends CartState {
  final List<ProductsDataModel> cartedItems;

  CartLoadedState({required this.cartedItems});
}
final class DeletedCartProductState extends CartState {
  final List<ProductsDataModel> cartedItems;

  DeletedCartProductState({required this.cartedItems});

}