import 'dart:convert';

import 'package:event_attendance/api/userApi.dart';
import 'package:event_attendance/models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:localstorage/localstorage.dart';

final GoogleAuthProvider _googleSignIn = GoogleAuthProvider();
final FirebaseAuth _auth = FirebaseAuth.instance;

Future<User> handleSignInWithEmail(
    {email, password, keepLoggedIn = true}) async {
  User loggedInUser;
  final FirebaseUser user =
      (await _auth.signInWithEmailAndPassword(email: email, password: password))
          .user;

  final LocalStorage storage = new LocalStorage('user');
  if (keepLoggedIn) {
    user.getIdToken().then((token) {
      storage.setItem('userToken', token.token);
      print('Saving token');
      print(storage.getItem('userToken'));
    });
  }
  fetchUser(user.uid).then((value) {
    print(value.userId);
    storage.setItem('username', value.username);
    loggedInUser = value;
  });
  return loggedInUser;
}

//TODO allow user to login through their username

//TODO allow user to login through Google mail
//Future<FirebaseUser> _handleGoogleSignIn() async{
//
//}

Future<FirebaseUser> createUserWithEmail({email, password}) async {
  final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
          email: email, password: password))
      .user;

  return user;
}
