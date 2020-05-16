part of 'trip_bloc.dart';

abstract class TripState extends Equatable {
  const TripState();
}

class TripInitial extends TripState {
  @override
  List<Object> get props => [];
}

class TripLoading extends TripState {
  const TripLoading();

  @override
  List<Object> get props => [];
}

class TripLoaded extends TripState {
  final List<Trip> trips;
  final bool reachedCap;

  const TripLoaded(this.trips, this.reachedCap);

  @override
  List<Object> get props => [trips, reachedCap];
}

class TripError extends TripState {
  final String message;

  const TripError(this.message);

  @override
  List<Object> get props => [message];
}
