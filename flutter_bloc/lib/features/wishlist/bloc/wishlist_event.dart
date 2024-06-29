part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}
class WishlistInitialEvent extends WishlistEvent {}
class DeleteWishlistedItemEvent extends WishlistEvent {
  final ProductsDataModel wishlistedItem;

  DeleteWishlistedItemEvent({required this.wishlistedItem});
}
class AddToCartEvent extends WishlistEvent {
  final ProductsDataModel wishlistedItem;

  AddToCartEvent({required this.wishlistedItem});
}