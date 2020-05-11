part of 'trip_bloc.dart';

abstract class TripEvent extends Equatable {
  const TripEvent();
}

class GetTrips extends TripEvent {
  final int count;

  GetTrips(this.count);

  @override
  List<Object> get props => [count];
}

class ToggleLikeTrip extends TripEvent {
  @override
  List<Object> get props => [];
}
