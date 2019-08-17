


import 'package:event_attendance/api/eventApi.dart';
import 'package:event_attendance/models/EventModel.dart';
import 'package:flutter/material.dart';

class EventList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _EventListState();
  }

}

class _EventListState extends State<EventList>{

  List<Event> _eventList = [];

  void getEvents(userId){
//    get all events from the api for the current user
      fetchEvents(userId).then((value) => _eventList=value );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

}