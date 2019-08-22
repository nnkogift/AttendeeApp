import 'package:event_attendance/events/eventListPage.dart';
import 'package:event_attendance/landing/LoadingWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class LandingPage extends StatefulWidget {
  LandingPageState createState() => LandingPageState();

  static const String routeName = '/';
}

class LandingPageState extends State<LandingPage> {
  final LocalStorage storage = LocalStorage('user');

  Future<String> navigate() async{
    String user = await storage.getItem('userToken');
    print(user);
    return user;

  }


  @override
  void initState()  {
    // TODO: implement initState
    navigate().then((user){
      if(user == null){
        Future.delayed(Duration(seconds: 3),(){
          Navigator.pushReplacementNamed(context, '/login');
        });

      } else{
        Future.delayed(Duration(seconds: 3),(){
          Navigator.pushReplacementNamed(context, EventsListPage.routeName);
        });
      }
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top:150.0),),
            FlutterLogo(size: 200,),
            Text("Flutter Dev Community"),
            Loading(),
            Text('Please Wait...')
          ],
        ));
  }
}
