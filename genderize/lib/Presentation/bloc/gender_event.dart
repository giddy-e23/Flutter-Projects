part of 'gender_bloc.dart';

@immutable
sealed class GenderEvent {}

class GetGenderEvent extends GenderEvent {
  final String name;

  GetGenderEvent({required this.name});
}
