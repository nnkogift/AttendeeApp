import 'package:event_attendance/attendee/attendeeListPage.dart';
import 'package:event_attendance/models/EventModel.dart';
import 'package:flutter/material.dart';

class SingleEventPage extends StatefulWidget {
  
  final Event event;
  
  SingleEventPage({this.event});

  static const String routeName = "/single-event";


  final String title = 'Event';

  @override
  _SingleEventPageState createState() => _SingleEventPageState();
}

class _SingleEventPageState extends State<SingleEventPage> {

  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.event.name),
        backgroundColor: const Color(0xFF00BCD4),
      ),
      body: new Container(
        child: Column(
          children: <Widget>[
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  widget.event.name,
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
            ),
            Divider(),
            Text(
              widget.event.date,
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
                        text: widget.event.description,
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
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> AttendeeListPage(eventId: widget.event.eventId) ));
              },),
            ),
            Divider(),

          ],
        ),
      ),
    );
  }
}
