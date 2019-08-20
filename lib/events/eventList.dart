import 'package:event_attendance/api/eventApi.dart';
import 'package:event_attendance/api/userApi.dart';
import 'package:event_attendance/models/EventModel.dart';
import 'package:event_attendance/models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class EventList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EventListState();
  }
}

class _EventListState extends State<EventList> {
  List<Event> _events = [];

  bool _isEventsListLoading = true;

  User _user;

  @override
  void initState() {
    getUser().then((user) {
      _user = user;
      print(_user);
      _getEvents(_user.userId);
    });

    super.initState();
  }

  Future<User> getUser() async {
    await fetchUser('5d5b22378b87bc0007ed0ee8').then((user) {
      print('fetchUser' + user.userId);
      return user;
    });
    return null;
  }

  void _getEvents(userId) {
//    get all events from the api for the current user
    _isEventsListLoading = true;
    fetchEvents(userId).then((value) {
      setState(() {
        _events = value;
        _isEventsListLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    if (_isEventsListLoading) {
      return Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 100.0),
            child: SpinKitWanderingCubes(
              color: Color(0xFF00BCD4),
            ),
          ),
        ),
      );
    } else if (_events == []) {
      return Container(
          child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 100.0),
          child: Text(
            'You have no events registered',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ));
    } else {
      return Container(
        child: Center(
          child:
              ListView.builder(itemBuilder: (BuildContext context, int index) {
            return Row(
              children: <Widget>[
                Text(_events[index].name),
                Padding(
                  padding: EdgeInsets.only(left: 40.0),
                  child: Text(_events[index].date),
                )
              ],
            );
          }),
        ),
      );
    }
  }
}
