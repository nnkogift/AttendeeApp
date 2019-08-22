import 'package:event_attendance/api/eventApi.dart';
import 'package:event_attendance/api/userApi.dart';
import 'package:event_attendance/events/SingleEventPage.dart';
import 'package:event_attendance/models/EventModel.dart';
import 'package:event_attendance/models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class EventList extends StatefulWidget {
  final String userId;

  EventList({this.userId});

  @override
  State<StatefulWidget> createState() {
    return _EventListState();
  }
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Event>>(
        stream: fetchEvents('5d5b22378b87bc0007ed0ee8').asStream(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 60.0),
                  child: SpinKitWave(
                    color: Color(0xFF00BCD4),
                  ),
                ),
              ),
            );
          } else {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey,
                );
              },
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Row(
                    children: <Widget>[
                      Text(snapshot.data[index].name),
//                        Padding(
//                          padding: EdgeInsets.only(left: 150.0),
//                          child: Text(snapshot.data[index].date),
//                        )
                    ],
                  ),
                  subtitle: Text(snapshot.data[index].description),
                  trailing: Icon(Icons.arrow_forward_ios),
                  leading: Icon(Icons.calendar_today),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => SingleEventPage(
                                  event: snapshot.data[index],
                                )));
                  },
                );
              },
            );
          }
        });
  }
}
