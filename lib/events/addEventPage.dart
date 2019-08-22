
import 'package:event_attendance/events/addEventForm.dart';
import 'package:flutter/material.dart';

class AddEventPage extends StatefulWidget {
  AddEventPage({Key key}) : super(key: key);

  static const String routeName = "/AddEventPage";

  final String title= 'Add New Event';

  @override
  _AddEventPageState createState() => new _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        backgroundColor: Color(0xFF00BCD4),
      ),
      body: new Container(
        child: EventForm(),
      ),

    );
  }

}
