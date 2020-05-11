import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tripify/data/models/trip.dart';
import 'package:tripify/data/trip_repository.dart';

part 'trip_event.dart';
part 'trip_state.dart';

class TripBloc extends Bloc<TripEvent, TripState> {
  final TripRepository _tripRepository;
  final tripCap = 30;
  List<Trip> trips = [];

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
        if (trips.length < tripCap) {
          final newTrips = await _tripRepository.getTrips(event.count);
          trips = trips + newTrips;
          yield TripLoaded(trips, false);
        } else {
          yield TripLoaded(List<Trip>.from(trips), true);
        }
      } on Error {
        // TODO
      }
    } else if (event is ToggleLikeTrip) {
      trips = List<Trip>.from(trips.map((trip) {
        {
          if (trip.id == event.trip.id) {
            return Trip(
              id: trip.id,
              title: trip.title,
              subtitle: trip.subtitle,
              likes: event.value ? event.trip.likes + 1 : event.trip.likes - 1,
              isLiked: event.value,
            );
          }
          return trip;
        }
      }));
      yield TripLoaded(trips, trips.length >= tripCap);
    }
  }
}
