import 'package:event_attendance/events/eventListPage.dart';
import 'package:event_attendance/models/UserModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:event_attendance/api/userApi.dart';

class SignUpForm extends StatefulWidget {
  SignUpFormState createState() => SignUpFormState();
}

class SignUpFormState extends State<SignUpForm> {
  String username, password, email, fullName, position;

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _positionController = TextEditingController();
  final _addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 60.0),
          child: Center(
              child: Text(
            'Sign Up',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w900, color: Colors.white),
          )),
        ),
        Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                  child: TextFormField(
                    controller: _usernameController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please provide your username';
                      }
//                      else if (doesUsernameExist(input))
//                        return 'Username already exsists';
                      else {
                        return null;
                      }
                    },
                    onSaved: (input) {},
                    decoration: InputDecoration(
                        labelText: 'Username',
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
                    controller: _passwordController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please provide your password';
                      } else if (input.length < 8) {
                        return 'Please provide a longer password';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (input) {},
                    decoration: InputDecoration(
                        labelText: 'Password',
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
                    controller: _positionController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please provide your position';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (input) {},
                    decoration: InputDecoration(
                        labelText: 'Position',
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
                    controller: _addressController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please provide your position';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (input) {},
                    decoration: InputDecoration(
                        labelText: 'Address',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 10, left: 10.0),
                    child: Center(
                      child: Row(
                        children: <Widget>[
                          Center(
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: 'Already have an account? ',
                                  style: TextStyle(color: Colors.grey)),
                              TextSpan(
                                  text: 'Login',
                                  style: TextStyle(color: Colors.blue),
                                  recognizer: new TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushReplacementNamed(
                                          context, '/login');
                                    }),
                            ])),
                          )
                        ],
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: ButtonTheme(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            User user = signUpUser();
                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text('Signing you up...')));
                            Navigator.pushReplacementNamed(
                                context, EventsListPage.routeName,
                                arguments: user);
                          }
                        },
                        child: Text('Sign Up'),
                      )),
                )
              ],
            ))
      ],
    );
  }

  bool doesUsernameExist(String input) {
    usernameExists(input).then((value) {
      return value;
    }).catchError((error) {
      return false;
    });
    return false;
  }

  bool doesEmailExist(String input) {
    emailExists(input).then((value) {
      return value;
    }).catchError((error) {
      return false;
    });
    return false;
  }

  User signUpUser() {
    User user = User(
        userId: 'none',
        username: _usernameController.text,
        email: _emailController.text,
        position: _positionController.text,
        fullName: _fullNameController.text,
        address: _addressController.text);
    print('created User Instance...');

    user.password = _passwordController.text;
    createUser(user).then((createdUser) {
      print(createdUser);
      //Navigate to List of Events
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Welcome, ' + user.fullName)));

      return createdUser;
    });
    return null;
  }
}
