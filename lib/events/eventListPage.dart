

import 'package:event_attendance/api/userApi.dart';
import 'package:event_attendance/models/UserModel.dart';
import 'package:flutter/material.dart';

import 'eventList.dart';

class EventsListPage extends StatefulWidget {
  EventsListPage({Key key }) : super(key: key);

  static const String routeName = "/eventsListPage";

  final String title = 'Your Events';


  @override
  _EventsListPageState createState() => new _EventsListPageState();
}

class _EventsListPageState extends State<EventsListPage> {







  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        backgroundColor: const Color(0xFF00BCD4),
      ),
      body: EventList(),
      floatingActionButton: new FloatingActionButton(
        onPressed: _onFloatingActionButtonPressed,
        tooltip: 'Add New Event',
        backgroundColor: const Color(0xFF00BCD4),
        child: new Icon(Icons.add),
      ),
    );
  }

  void _onFloatingActionButtonPressed() {
  }
}