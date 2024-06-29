part of 'home_bloc.dart';

@immutable
sealed class HomeState {}
abstract class HomeActionState extends HomeState{}

final class HomeInitial extends HomeState {}
class HomeLoadingState extends HomeState {}
class HomeLoadedSuccessState extends HomeState{
final  List<ProductsDataModel> products;
  HomeLoadedSuccessState({required this.products});
}
class HomeErrorState extends HomeState {}
class HomeNavigateToWishlistPageActionState extends HomeActionState {
}
class HomeNavigateToCartPageActionState extends HomeActionState {}

class HomeWishListClikedState extends HomeState {}
class HomeCartClikedState extends HomeState {}

class HomeWishListAddedState extends HomeActionState {}
class HomeCartAddedState extends HomeActionState {}

class LikedActionState extends HomeActionState {}
class AlreadyLikedActionState extends HomeActionState {}