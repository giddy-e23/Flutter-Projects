part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}
abstract class WishlistActionState extends WishlistState {}

final class WishlistInitial extends WishlistState {}
final class WishlistLoadedState extends WishlistState {
  final List<ProductsDataModel> wishlist;

  WishlistLoadedState({required this.wishlist});
}
