import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tripify/bloc/trip_bloc.dart';
import 'package:tripify/data/models/trip.dart';

class Feed extends StatefulWidget {
  const Feed({Key key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TripBloc>(context)..add(GetTrips(10));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripBloc, TripState>(
      bloc: BlocProvider.of<TripBloc>(context),
      builder: (context, state) {
        if (state is TripLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is TripLoaded) {
          return _buildFeed(context, state);
        } else {
          return Center(child: Text('Could not load trips'));
        }
      },
    );
  }

  Widget _buildFeed(BuildContext context, TripLoaded state) {
    return ListView.builder(
        padding: const EdgeInsets.only(left: 1.0, right: 1.0, top: 5.0),
        itemCount: state.trips.length + 1,
        itemBuilder: (context, index) {
          if (index < state.trips.length) {
            return _buildRow(context, state.trips[index]);
          } else if (state.reachedCap && index == state.trips.length) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Center(
                child: Text('Oops! You\'ve read all the stories...'),
              ),
            );
          } else {
            BlocProvider.of<TripBloc>(context)..add(GetTrips(10));
            return BottomLoader();
          }
        });
  }

  Widget _buildRow(BuildContext context, Trip trip) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 170,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('assets/images/pic2.jpg',
                        fit: BoxFit.cover),
                  ),
                ),
                Text(
                  trip.title,
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  trip.subtitle,
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
        ),
        actions: <Widget>[
          IconSlideAction(
            closeOnTap: false,
            caption: trip.likes.toString(),
            color: Colors.white,
            icon: Icons.favorite_border,
            onTap: () => null, // TODO
          ),
        ],
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'Remove',
            color: Colors.white,
            icon: Icons.remove_circle_outline,
            onTap: () => null, // TODO
          ),
        ],
      ),
    );
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}
