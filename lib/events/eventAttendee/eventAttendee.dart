import 'package:event_attendance/api/attendeeApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:event_attendance/models/AttendeeModel.dart';

class EventAttendee extends StatefulWidget {
  EventAttendeeState createState() => EventAttendeeState();
}

class EventAttendeeState extends State<EventAttendee> {
  List<Widget> _attendees = [];

  void getAttendees(eventId) {
    fetchAttendees(eventId).then((value) => {

    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Udicti Meeting',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
          ),
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 30.0,
              color: Colors.grey.withOpacity(0.7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('Atendees'),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (BuildContext context, position) {
                    return Container(
                      height: 40.0,
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: _attendees,
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ));
    ;
  }
}
