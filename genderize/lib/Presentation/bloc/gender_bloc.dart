import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genderize/data/data_model/GenderDataModel.dart';
import 'package:meta/meta.dart';

import '../../data/repository/gender_repository.dart';

part 'gender_event.dart';
part 'gender_state.dart';

class GenderBloc extends Bloc<GenderEvent, GenderState> {
  GenderBloc() : super(GenderInitial()) {
    on<GetGenderEvent>(getGenderEvent);
    on<GenderEvent>((event, emit) {
      // TODO: implement event handler
    });

  }

  FutureOr<void> getGenderEvent(GetGenderEvent event, Emitter<GenderState> emit) async {
    GenderRepo genderRepo = GenderRepo(name: event.name);
    GenderDataModel genderData = await genderRepo.getData();
    emit(GenderRevealState(genderData: genderData));
  }
}
