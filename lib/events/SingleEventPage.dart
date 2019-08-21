import 'package:event_attendance/attendee/attendeeListPage.dart';
import 'package:event_attendance/models/EventModel.dart';
import 'package:flutter/material.dart';

class SingleEventPage extends StatefulWidget {

  static const String routeName = "/single-event";


  final String title = 'Event';

  @override
  _SingleEventPageState createState() => _SingleEventPageState();
}

class _SingleEventPageState extends State<SingleEventPage> {

  final Event _event = Event(
      eventId: '123456789',
      userId: 'kfjsklfsfs',
      name: 'Beach Party',
      date: '22-09-2019',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed imperdiet lacus eget lacus convallis, nec maximus augue tempor. Vivamus vehicula nec tortor sit amet lacinia. Ut at eros et lorem vulputate efficitur. Nulla venenatis semper imperdiet. Proin auctor eu ipsum eget hendrerit. Nam volutpat venenatis enim non molestie. Nullam iaculis, enim eget iaculis laoreet, elit justo porttitor nisi, mollis feugiat nisi eros id nisi. Curabitur non vestibulum elit.'
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(_event.name),
        backgroundColor: const Color(0xFF00BCD4),
      ),
      body: new Container(
        child: Column(
          children: <Widget>[
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  _event.name,
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
            ),
            Divider(),
            Text(
              _event.date,
              style: TextStyle(fontSize: 20.0),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                        text: _event.description,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black)),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.0),
              child: RaisedButton(
                child: Text('View Attendees'), onPressed: () {
                  Navigator.pushNamed(context, AttendeeListPage.routeName, arguments: { 'eventId': _event.eventId });
              },),
            ),
            Divider(),

          ],
        ),
      ),
    );
  }
}
