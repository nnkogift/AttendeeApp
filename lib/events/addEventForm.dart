import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:event_attendance/api/eventApi.dart';
import 'package:event_attendance/attendee/attendeeListPage.dart';
import 'package:event_attendance/landing/LoadingWidget.dart';
import 'package:event_attendance/models/EventModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';

class EventForm extends StatefulWidget {
  @override
  _EventFormState createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  bool _isPageLoading = false;

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _dateController = TextEditingController();
  final _descriptionController = TextEditingController();

  final format = DateFormat("yyyy-MM-dd");

  @override
  Widget build(BuildContext context) {
    if(_isPageLoading){
        return Container(
          child: Center(
            child: Padding(padding: EdgeInsets.only(top: 220.0),
            child: Column(
              children: <Widget>[
                Loading(),
                Text('Creating event...')
              ],
            ),),
          ),
        );
    }else{
    return ListView(
      children: <Widget>[
        Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 40.0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                  child: TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please provide a Name for the event';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (input) {},
                    decoration: InputDecoration(
                        labelText: 'Name',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                  child: Column(
                    children: <Widget>[
                      DateTimeField(
                          format: format,
                          controller: _dateController,
                          onShowPicker: (context, currentValue) async {
                            return await showDatePicker(
                                context: context,
                                firstDate: DateTime(1900),
                                initialDate: currentValue ?? DateTime.now(),
                                lastDate: DateTime(2100));
                          },
                          decoration: InputDecoration(
                              labelText: 'Date of Event',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ))),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                  child: TextFormField(
                    controller: _descriptionController,
                    keyboardType: TextInputType.text,
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please provide a description for the event';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (input) {},
                    decoration: InputDecoration(
                      labelText: 'Description',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    maxLines: 5,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: ButtonTheme(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: RaisedButton(
                        color: Color(0xFF00BCD4),
                        textColor: Colors.white,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              _isPageLoading = true;
                            });
                            _addEvent();
                          }
                        },
                        child: Text('Add Event'),
                      )),
                )
              ],
            ))
      ],
    );
  }}

  void _addEvent() {


    Event event = Event(
      date: _dateController.text,
      description: _descriptionController.text,
      userId: '123456',
      name: _nameController.text,
      eventId: randomString(10)
    );

    createEvent(event).then((createdEvent) {
      setState(() {
        _isPageLoading = false;
      });
      Navigator.popAndPushNamed(context, AttendeeListPage.routeName,
          arguments: {'eventId': createdEvent.eventId});
    });
  }
}
