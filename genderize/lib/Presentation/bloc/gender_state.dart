part of 'gender_bloc.dart';

@immutable
sealed class GenderState {}

final class GenderInitial extends GenderState {
}
class GenderRevealState extends GenderState {
  final GenderDataModel genderData;

  GenderRevealState({required this.genderData});
}
