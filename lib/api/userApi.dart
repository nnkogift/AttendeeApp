import 'dart:convert';

import 'package:event_attendance/config/apiConfig.dart';
import 'package:event_attendance/models/UserModel.dart';
import 'package:http/http.dart' as http;




Future<List<User>> fetchUsers(userId) async {
  final response = await http.get(BASE_URL + EVENT_URL);

  if (response.statusCode == 200){
    List<User> eventList = [];

    for(Map<String, dynamic> event in json.decode(response.body)){
      eventList.add(User.fromJson(event));
    }
    return eventList;
  }
  else{
    throw Exception('Error fetching Users');
  }
}

Future<User> fetchUser(eventId) async {
  final response = await http.get(BASE_URL + EVENT_URL);

  if (response.statusCode ==  200){
    return User.fromJson(json.decode(response.body));
  }
  else{
    throw Exception('Error fetching User');
  }
}

Future<User> createUser(User user) async {

  final Map<String, dynamic> eventData = {
    'username': user.username,
    'fullName': user.fullName,
    'email': user.email,
    'phoneNo': user.phoneNo,
    'position': user.position,
    'password': user.password
  };

  final response = await http.post(BASE_URL + EVENT_URL, body: json.encode(eventData));

  if(response.statusCode == 200){
    return User.fromJson(json.decode(response.body));
  }
  else{
    throw Exception('Error Creating an User');
  }
}

Future<User> updateUser(User user) async{
  final Map<String, dynamic> eventData = {
    'username': user.username,
    'fullName': user.fullName,
    'email': user.email,
    'phoneNo': user.phoneNo,
    'position': user.position
  };

  final response = await http.put(BASE_URL + EVENT_URL + user.userId, body: json.encode(eventData));

  if (response.statusCode == 200){
    return  User.fromJson(json.decode(response.body));
  }
  else{
    throw Exception('Error Updating User');
  }
}

Future<User> deleteUser(userId) async {
  final response = await http.delete(BASE_URL + EVENT_URL + userId);

  if (response.statusCode == 200){
    return User.fromJson(json.decode(response.body));
  }
  else{
    throw Exception('Error Deleting User');
  }
}

//Future<User> loginUser(username, password) async {
//  final Map<String, dynamic> credentials = {
//    'username': username,
//    'password': password
//  };
//
//  final response = await http.post(BASE_URL + LOGIN_URL, body: json.encode(credentials));
//
//
//  if (response.statusCode == 200)
//}


