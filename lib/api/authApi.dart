import 'package:event_attendance/api/userApi.dart';
import 'package:event_attendance/models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

final GoogleAuthProvider _googleSignIn = GoogleAuthProvider();
final FirebaseAuth _auth = FirebaseAuth.instance;

Future<FirebaseUser> handleSignInWithEmail({email, password}) async {
  final FirebaseUser user =
      (await _auth.signInWithEmailAndPassword(email: email, password: password))
          .user;

  fetchUser(user.uid).then((value) {
    return value;
  });
  return null;
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
