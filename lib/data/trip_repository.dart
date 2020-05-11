import 'package:uuid/uuid.dart';

import 'models/trip.dart';

abstract class TripRepository {
  Future<List<Trip>> getTrips(int count);
}

class FakeTripRepository extends TripRepository {
  final uuid = Uuid();
  @override
  Future<List<Trip>> getTrips(int count) {
    return Future.delayed(Duration(milliseconds: 2000), () {
      final List<Trip> trips = [];
      for (var i = 0; i < count; i++) {
        trips.add(Trip(
          id: uuid.v4(),
          title: 'Разходка из Рила',
          subtitle: 'РилаРилаРилаРилаРилаРилаРилаРила',
          likes: 1000,
          isLiked: false,
        ));
      }
      return trips;
    });
  }
}
