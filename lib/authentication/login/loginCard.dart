import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget{
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm>{
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top:30.0),
          child: Container(
            alignment: Alignment.center,
            child: Text('Attendee', style: TextStyle(fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.white,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.black45,
                  offset: Offset(5.0, 5.0),
                ),
              ],
            ),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:60),
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
                                padding: EdgeInsets.only(top: 20.0),
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (input){},
                                  onSaved: (input){},
                                  decoration: InputDecoration(
                                    labelText: 'userName',
                                     filled: true,
                                    fillColor: Colors.grey,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: TextFormField(
                                  obscureText: true,
                                  validator: (input){},
                                  onSaved: (input){},
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                     filled: true,
                                    fillColor: Colors.grey,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )
                                  ),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                      checkColor: Color(0xFF00BCD4),
                                      value: false,
                                      onChanged: (input){}),
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
                                      borderRadius: BorderRadius.circular(20.0)
                                    ),
                                    child: RaisedButton(
                                        onPressed: (){},
                                    child: Text('LOGIN'),
                                    elevation: 10.0,),
                                  ),),
                                  Padding(
                                      padding: EdgeInsets.only(top: 20),
                                  child: ButtonTheme(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0)
                                    ),
                                    child: RaisedButton(
                                        onPressed: (){},
                                    child: Text('SIGN UP'),
                                    elevation: 10.0,),
                                  ),),
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