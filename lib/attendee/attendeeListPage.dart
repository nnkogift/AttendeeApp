import 'package:event_attendance/attendee/addAttendeePage.dart';
import 'package:event_attendance/attendee/attendeeList.dart';
import 'package:flutter/material.dart';

class AttendeeListPage extends StatefulWidget {
  AttendeeListPage({Key key, this.eventId}) : super(key: key);

  static const String routeName = "/attendees";

  final String eventId;

  final String title = 'Attendees';

  @override
  _State createState() => new _State();
}

class _State extends State<AttendeeListPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        backgroundColor: const Color(0xFF00BCD4),
      ),
      body: new Container(
        child: Center(
          child: AttendeeList(widget.eventId),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _onFloatingActionButtonPressed,
        backgroundColor: const Color(0xFF00BCD4),
        tooltip: 'Add an attendee on this event',
        child: new Icon(Icons.add),
      ),
    );
  }

  void _onFloatingActionButtonPressed() {
    Navigator.pushNamed(context, AddAttendeePage.routeName, arguments: {'eventId': widget.eventId}).then((value){
      setState(() {

      });
    });
  }
}
