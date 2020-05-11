import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tripify/data/models/trip.dart';
import 'package:tripify/data/trip_repository.dart';

part 'trip_event.dart';
part 'trip_state.dart';

class TripBloc extends Bloc<TripEvent, TripState> {
  final TripRepository _tripRepository;
  final List<Trip> trips = [];

  TripBloc(this._tripRepository);

  @override
  TripState get initialState => TripInitial();

  @override
  Stream<TripState> mapEventToState(
    TripEvent event,
  ) async* {
    if (trips.length == 0) {
      yield TripLoading();
    }
    if (event is GetTrips) {
      try {
        if (trips.length < 30) {
          final newTrips = await _tripRepository.getTrips(event.count);
          trips.addAll(newTrips);
          yield TripLoaded(List<Trip>.from(trips), false);
        } else {
          yield TripLoaded(List<Trip>.from(trips), true);
        }
      } on Error {
        // TODO
      }
    }
  }
}
