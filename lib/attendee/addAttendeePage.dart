import 'package:event_attendance/attendee/addAttendeeForm.dart';
import 'package:flutter/material.dart';

class AddAttendeePage extends StatefulWidget {
  AddAttendeePage({Key key}) : super(key: key);

  static const String routeName = "/AddAttendeePage";

  final String title = 'Add Attendee';

  @override
  _AddAttendeePageState createState() => new _AddAttendeePageState();
}

class _AddAttendeePageState extends State<AddAttendeePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        backgroundColor: Color(0xFF00BCD4),
      ),
      body: new Container(
        child: AttendeeForm(),
      ),
    );
  }
}
