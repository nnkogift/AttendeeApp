import 'dart:convert';

import 'package:event_attendance/config/apiConfig.dart';
import 'package:event_attendance/models/AttendeeModel.dart';
import 'package:http/http.dart' as http;

Future<List<Attendee>> fetchAttendees(eventId) async {
  final response =
      await http.get(ATTENDEES_URL + "search/findAllByEventId?eventId=" + eventId, headers: HEADER);

  if (response.statusCode == 200) {
    List<Attendee> attendeeList = [];

    for (Map<String, dynamic> attendee
        in json.decode(response.body)['_embedded']['attendees']) {
      attendeeList.add(Attendee.fromJson(attendee));
    }
    return attendeeList;
  } else {
    throw Exception('Error fetching Attendees');
  }
}

Future<Attendee> fetchAttendee(attendeeId) async {
  final response = await http.get(ATTENDEES_URL + attendeeId, headers: HEADER);

  if (response.statusCode == 200) {
    return Attendee.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error fetching Attendee');
  }
}

Future<Attendee> createAttendee(Attendee attendee) async {
  final Map<String, dynamic> attendeeData = {
    'fullName': attendee.fullName,
    'eventId': attendee.eventId,
    'phoneNo': attendee.phoneNo,
    'email': attendee.email,
    'attendeeId': attendee.attendeeId
  };

  final response =
      await http.post(ATTENDEES_URL, body: json.encode(attendeeData), headers: HEADER);

  if (response.statusCode == 200) {
    return Attendee.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error Creating an Attendee');
  }
}

Future<Attendee> updateAttendee(Attendee attendee) async {
  final Map<String, dynamic> attendeeData = {
    'fullName': attendee.fullName,
    'eventId': attendee.eventId,
    'phoneNo': attendee.phoneNo,
    'email': attendee.email
  };

  final response = await http.patch(ATTENDEES_URL + attendee.attendeeId,
      body: json.encode(attendeeData), headers: HEADER);

  if (response.statusCode == 200) {
    return Attendee.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error Updating Attendee');
  }
}

Future<Attendee> deleteAttendee(attendeeId) async {
  final response = await http.delete(ATTENDEES_URL + attendeeId, headers: HEADER);

  if (response.statusCode == 200) {
    return Attendee.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error Deleting Attendee');
  }
}
