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
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque a consectetur enim, at laoreet tellus. Donec fringilla molestie mi, in pellentesque ante fringilla cursus. Ut sodales ipsum quis elit auctor ultricies. Nunc tristique lectus tortor, in dapibus lorem porttitor quis. Praesent rhoncus lorem justo, nec viverra sapien commodo quis. Donec vel urna nunc. Curabitur sed felis erat. Etiam risus dui, dictum ut fermentum ac, blandit eget odio. Phasellus faucibus massa vel diam pulvinar, vitae dignissim quam malesuada. Nam eget neque orci. Nullam aliquet magna erat. Nulla imperdiet ex venenatis nisl semper, non faucibus mauris gravida.Proin auctor, est eget tincidunt sodales, sapien erat iaculis purus, at condimentum odio urna in ipsum. Pellentesque imperdiet, quam at porta rhoncus, lacus magna feugiat elit, ornare cursus sapien purus id massa. Nunc mattis aliquam lectus eget dignissim. Praesent sed diam et diam malesuada congue ut at sapien. Duis ac elit nulla. Sed quis condimentum justo. Nam iaculis gravida sapien, in sodales ex finibus sed. Aliquam erat volutpat. Nam elementum dui laoreet lectus rutrum cursus. Quisque orci odio, congue sit amet facilisis sed, condimentum id est. Sed tempor pretium aliquam. Integer pellentesque nibh nec euismod varius. Aenean volutpat augue sit amet enim accumsan placerat. Sed eu fringilla augue. Donec ultrices nibh sed tortor pharetra vulputate. Cras malesuada odio a nisi tempus, vel dignissim dui pretium.'));
      }
      return trips;
    });
  }
}
