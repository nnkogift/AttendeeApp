

import 'package:event_attendance/api/userApi.dart';
import 'package:event_attendance/events/addEventPage.dart';
import 'package:event_attendance/models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

import 'eventList.dart';

class EventsListPage extends StatefulWidget {
  final String userId;

  EventsListPage({Key key, this.userId }) : super(key: key);

  static const String routeName = "/eventsListPage";

  final String title = 'Your Events';


  @override
  _EventsListPageState createState() => new _EventsListPageState();
}

class _EventsListPageState extends State<EventsListPage> {
  LocalStorage storage = LocalStorage('user');


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        backgroundColor: const Color(0xFF00BCD4),
      ),
      body: EventList(userId: widget.userId,),
      floatingActionButton: new FloatingActionButton(
        onPressed: _onFloatingActionButtonPressed,
        tooltip: 'Add New Event',
        backgroundColor: const Color(0xFF00BCD4),
        child: new Icon(Icons.add),
      ),
    );
  }

  void _onFloatingActionButtonPressed() {
    Navigator.pushNamed(context, AddEventPage.routeName);
  }
}