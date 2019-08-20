import 'package:event_attendance/api/attendeeApi.dart';
import 'package:event_attendance/api/userApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:event_attendance/models/AttendeeModel.dart';

class EventAttendee extends StatefulWidget {
  EventAttendeeState createState() => EventAttendeeState();
}

class EventAttendeeState extends State<EventAttendee> {
  List<Widget> _attendees = [];
  bool _isLoading = true;

  void mapAttendees(List<Attendee> obj){
    for(Attendee attendee in obj){
       _attendees.add(Text(attendee.fullName));
    }
  }

  void getAttendees(eventId) {
    fetchAttendees(eventId).then((value){
      this.mapAttendees(value);
    }).catchError((error) => {});
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
                    if(this._isLoading){
                      return Container(
                        height: 40.0,
                        child: Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Loading...')
                            ],
                          ),
                        ),
                      );
                    }else{
                      return Container(
                        height: 40.0,
                        child: Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: _attendees,
                          ),
                        ),
                      );
                    }
                  }),
            ),
          ],
        ));
    ;
  }
}
