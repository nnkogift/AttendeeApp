import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventAtendee extends StatefulWidget{
  EventAtendeeState createState() => EventAtendeeState();

}
class EventAtendeeState extends State<EventAtendee>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Udicti Meeting',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 30),),
        ),
        body: Column(

          children: <Widget>[
            Container(
              height: 30.0,
              color: Colors.grey.withOpacity(0.7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('Atendees'),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text('Gift Nnko'),

                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        )
    );;
  }

}