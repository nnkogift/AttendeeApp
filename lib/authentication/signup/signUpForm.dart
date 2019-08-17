import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget{
  SignUpFormState createState() => SignUpFormState();
}
class SignUpFormState extends State<SignUpForm>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(

      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top:20.0),
          child: Center(
              child: Text('Sign Up', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),)),
        ),
        Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0,left: 10.0,right: 10.0),
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
                  padding: EdgeInsets.only(top: 20.0,left: 10.0,right: 10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (input){},
                    onSaved: (input){},
                    decoration: InputDecoration(
                        labelText: 'Names',
                        filled: true,
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0,left: 10.0,right: 10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (input){},
                    onSaved: (input){},
                    decoration: InputDecoration(
                        labelText: 'Email',
                        filled: true,
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0,left: 10.0,right: 10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (input){},
                    onSaved: (input){},
                    decoration: InputDecoration(
                        labelText: 'Position',
                        filled: true,
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0,left: 10.0,right: 10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
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
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: ButtonTheme(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: RaisedButton(
                        onPressed: (){},
                    child: Text('Submit'),)
                  ),
                )
              ],
            ))
      ],
    );
  }

}