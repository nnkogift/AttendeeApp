import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget{
  LandingPageState createState() => LandingPageState();

}

class LandingPageState extends State<LandingPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      appBar: AppBar(
        title: Text('Atendee App',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 30),),
      ),
        body: Column(

          children: <Widget>[
            Container(
        height: 30.0,
        color: Colors.grey.withOpacity(0.7),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('Recent Events'),
              Text('Date'),
          ],
        ),
        ),
            Expanded(
              child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (BuildContext context, position){
                    return Container(
                      height: 40.0,
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text('Udict Meating'),
                            Text('Udict Meating'),

                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        )
      );
  }

}