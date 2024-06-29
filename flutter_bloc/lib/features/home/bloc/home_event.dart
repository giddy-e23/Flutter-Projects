part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}
class HomeInitialEvent extends HomeEvent {
}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  final ProductsDataModel clickedProduct;

  HomeProductWishlistButtonClickedEvent({required this.clickedProduct});
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductsDataModel clickedProduct;

  HomeProductCartButtonClickedEvent({required this.clickedProduct});

}

class HomeWishlistButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}

class LikedEvent extends HomeEvent {
  final String likedProduct;

  LikedEvent({required this.likedProduct});
}

