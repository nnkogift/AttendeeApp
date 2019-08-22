import 'package:event_attendance/api/attendeeApi.dart';
import 'package:event_attendance/models/AttendeeModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AttendeeList extends StatefulWidget {

  AttendeeList(this.eventId);
  final String eventId;

  @override
  _AttendeeListState createState() => _AttendeeListState();
}


class _AttendeeListState extends State<AttendeeList> {




  List<Attendee> _attendees = [];
  bool _isAttendanceListLoading = true;

  @override
  void initState() {
    fetchAttendees(widget.eventId).then((value){
      setState(() {
        _attendees = value;
        _isAttendanceListLoading=false;
      });
    }).catchError((error){
      setState(() {
        _isAttendanceListLoading = false;
      });
      print('error');
      //TODO implement toast function
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    if (_isAttendanceListLoading) {
      return Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 100.0),
            child: SpinKitWave(
              color: Color(0xFF00BCD4),
            ),
          ),
        ),
      );
    } else if (_attendees == []) {
      return Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: Text(
                'You have no events registered',
                style: TextStyle(color: Colors.grey),
              ),
            );
    } else {
      return ListView.separated(itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.account_circle),
          title: Text(_attendees[index].fullName),
          subtitle: Text(_attendees[index].email),
          onTap: (){
            print('To be applied soon');
          },
        );
      }, separatorBuilder: (context, index) {
        return Divider(
          color: Colors.grey,
        );
      }, itemCount: _attendees.length);
    }
  }
}
