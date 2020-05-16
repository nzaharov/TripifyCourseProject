import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'trip_details_event.dart';
part 'trip_details_state.dart';

class TripDetailsBloc extends Bloc<TripDetailsEvent, TripDetailsState> {
  @override
  TripDetailsState get initialState => TripDetailsInitial();

  @override
  Stream<TripDetailsState> mapEventToState(
    TripDetailsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
