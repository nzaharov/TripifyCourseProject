part of 'trip_details_bloc.dart';

abstract class TripDetailsState extends Equatable {
  const TripDetailsState();
}

class TripDetailsInitial extends TripDetailsState {
  @override
  List<Object> get props => [];
}
