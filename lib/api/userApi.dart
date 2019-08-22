import 'dart:convert';

import 'package:event_attendance/config/apiConfig.dart';
import 'package:event_attendance/models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

import 'authApi.dart';




Future<List<User>> fetchUsers() async {
  final response = await http.get(USERS_URL, headers: HEADER);

  if (response.statusCode == 200){
    List<User> users = [];

    for(Map<String, dynamic> user in json.decode(response.body)['_embedded']['users']){
      users.add(User.fromJson(user));
    }
    return users;
  }
  else{
    throw Exception('Error fetching Users');
  }
}

Future<User>fetchUser(userId) async {
  final response = await http.get(USERS_URL + 'search/findUserByUserId?userId=' + userId, headers: HEADER);
  print(USERS_URL + 'search/findUserByUserId?userId=' + userId);

  if (response.statusCode ==  200){
    print(json.decode(response.body));
    print(User.fromJson(json.decode(response.body)).userId);
    return User.fromJson(json.decode(response.body));
  }
  else{
    throw Exception('Error fetching User');
  }
}


Future<User> recordUser(FirebaseUser authUser, user) async{
  final Map<String, dynamic> userData = {
    'username': user.username,
    'fullName': user.fullName,
    'email': user.email,
    'phoneNo': user.phoneNo,
    'position': user.position,
    'userId': authUser.uid
  };

  final response = await http.post(USERS_URL, body: json.encode(userData), headers: HEADER);

  if(response.statusCode == 200){
    print('Signup response' + response.body);
    return User.fromJson(json.decode(response.body));
  }
  else{
    print(response);
    throw Exception('Error Creating an User');
  }
}

Future<User> createUser(User user) async {
  createUserWithEmail(email: user.email, password: user.password).then((authUser){
    recordUser(authUser, user).then((recordedUser){ return recordedUser;});
  });
  return null;

}



Future<User> updateUser(User user) async{
  final Map<String, dynamic> eventData = {
    'username': user.username,
    'fullName': user.fullName,
    'email': user.email,
    'phoneNo': user.phoneNo,
    'position': user.position
  };

  final response = await http.put(USERS_URL + user.userId, body: json.encode(eventData), headers: HEADER);

  if (response.statusCode == 200){
    return  User.fromJson(json.decode(response.body));
  }
  else{
    throw Exception('Error Updating User');
  }
}

Future<User> deleteUser(userId) async {
  final response = await http.delete(USERS_URL + userId);

  if (response.statusCode == 200){
    return User.fromJson(json.decode(response.body));
  }
  else{
    throw Exception('Error Deleting User');
  }
}

Future<bool> usernameExists(username) async{
  fetchUsers().then((users){
    for(User user in users){
      if (user.username == username){
        return true;
      }
      else return false;
    }
  })
      .catchError((error){
        throw Exception('error validating username' + error);
  });
  throw Exception('Error validating username');
}

Future<bool> emailExists(email) async{
  fetchUsers().then((users){
    for(User user in users){
      if (user.email == email){
        return true;
      }
      else return false;
    }
  })
      .catchError((error){
    throw Exception('error validating email' + error);
  });

  throw Exception('Error validating email');
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


