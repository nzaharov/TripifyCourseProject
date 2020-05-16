import 'package:flutter/material.dart';

class TripDetails extends StatefulWidget {
  TripDetails({Key key}) : super(key: key);

  @override
  _TripDetailsState createState() => _TripDetailsState();
}

class _TripDetailsState extends State<TripDetails> {
  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).primaryColor;

    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TabBar(
                    unselectedLabelColor: themeColor,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: themeColor),
                    tabs: [
                      _buildRoundedTab('Trip', Icons.map),
                      _buildRoundedTab('Stops', Icons.pin_drop),
                      _buildRoundedTab(
                          'Gallery', Icons.photo_size_select_actual),
                    ]),
              ),
            ),
          ),
          body: TabBarView(children: [
            Icon(Icons.map),
            Icon(Icons.pin_drop),
            Icon(Icons.photo_size_select_actual),
          ]),
        ));
  }

  Widget _buildRoundedTab(String label, IconData icon) {
    return Tab(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 1,
            )),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, size: 18),
              SizedBox(width: 4),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}
