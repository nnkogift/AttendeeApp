import 'package:event_attendance/api/attendeeApi.dart';
import 'package:event_attendance/landing/LoadingWidget.dart';
import 'package:event_attendance/models/AttendeeModel.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class AttendeeForm extends StatefulWidget {
  @override
  _AttendeeFormState createState() => _AttendeeFormState();
}

class _AttendeeFormState extends State<AttendeeForm> {
  bool _isPageLoading = false;

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNoController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    if (_isPageLoading) {
      return Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 220.0),
            child: Column(
              children: <Widget>[Loading(), Text('Adding Attendee...')],
            ),
          ),
        ),
      );
    }

    return ListView(
      children: <Widget>[
        Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                  child: TextFormField(
                    controller: _fullNameController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please provide your full Name';
                      } else if (!input.contains(' ')) {
                        return 'Please provide your full name separated by single space';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (input) {},
                    decoration: InputDecoration(
                        labelText: 'Full Name',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please provide your email';
                      } else if (!input.contains('@')) {
                        return 'Please provide a valid email';
                      }
//                      else if (doesEmailExist(input))
//                        return 'User with the email already exists';
                      else {
                        return null;
                      }
                    },
                    onSaved: (input) {},
                    decoration: InputDecoration(
                        labelText: 'Email',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                  child: TextFormField(
                    controller: _phoneNoController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please provide your Phone Number';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (input) {},
                    decoration: InputDecoration(
                        labelText: 'Phone No',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: ButtonTheme(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              _isPageLoading = true;
                              registerAttendee();
                            });
                          }
                        },
                        child: Text('Add Attendee'),
                      )),
                )
              ],
            ))
      ],
    );
  }

  void registerAttendee() {
    Attendee attendee = Attendee(
        fullName: _fullNameController.text,
        eventId: '123456',
        email: _emailController.text,
        phoneNo: _phoneNoController.text,
        attendeeId: randomString(10));

    createAttendee(attendee).then((registeredAttendee) {
      Navigator.pop(context);
    });
  }
}
