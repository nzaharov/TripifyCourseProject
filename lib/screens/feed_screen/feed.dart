import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Feed extends StatelessWidget {
  const Feed({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildFeed(context),
    );
  }

  Widget _buildFeed(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(left: 1.0, right: 1.0, top: 5.0),
        itemBuilder: (context, i) {
          if (i < 100) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: _buildRow(context, i),
            );
          } else if (i == 100) {
            return Column(children: [
              _buildRow(context, i),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Center(
                  child: Text('Oops! You\'ve read all the stories...'),
                ),
              )
            ]);
          }
          return null;
        });
  }

  Widget _buildRow(BuildContext context, int index) {
    return Slidable(
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
                  child:
                      Image.asset('assets/images/pic2.jpg', fit: BoxFit.cover),
                ),
              ),
              Text('Разходка из Рила', style: TextStyle(fontSize: 25),),
              Text('SubtitleSubtitleSubtitleSubtitleSubtitleSubtitle',style: TextStyle(fontSize: 18),)
            ],
          ),
        ),
      ),
      actions: <Widget>[
        IconSlideAction(
          caption: '120',
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
    );
  }
}
