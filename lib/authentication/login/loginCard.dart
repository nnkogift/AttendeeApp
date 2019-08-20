import 'package:event_attendance/api/authApi.dart';
import 'package:event_attendance/events/eventListPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 30.0, bottom: 100.0),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              'Attendee',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black45,
                    offset: Offset(5.0, 5.0),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  height: 300.0,
                  width: 300.0,
                  child: Form(
                      child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 40.0),
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
                              labelText: 'email',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Please provide your password';
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
                      Row(
                        children: <Widget>[
                          Checkbox(
                              checkColor: Color(0xFF00BCD4),
                              value: true,
                              onChanged: (input) {}),
                          Text('Keep me signed in'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: ButtonTheme(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: RaisedButton(
                                onPressed: () {
                                  //Login the user, navigate to Event list
                                  handleSignInWithEmail(
                                          email: _usernameController.text,
                                          password: _passwordController.text)
                                      .then((user) {
                                        print(user);
                                    Navigator.pushReplacementNamed(
                                        context, EventsListPage.routeName, arguments: user);
                                  }).catchError((error) {
                                    print(error);
                                  });
                                },
                                child: Text('LOGIN'),
                                elevation: 10.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: ButtonTheme(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/signup');
                                },
                                child: Text('SIGN UP'),
                                elevation: 10.0,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
