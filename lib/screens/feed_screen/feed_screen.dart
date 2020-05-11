import 'package:flutter/material.dart';
import 'package:tripify/screens/feed_screen/feed.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      drawer: Drawer(
        child: null,
      ),
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'My Feed',
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: primaryColor),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter_list, color: primaryColor),
            onPressed: null,
          ),
        ],
      ),
      body: Feed(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}
