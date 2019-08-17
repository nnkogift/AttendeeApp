import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loginCard.dart';

class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
       decoration: BoxDecoration(
         gradient: LinearGradient(
             colors: [
               const Color(0xFF00BCD4),
               const Color(0xFFFFFFFF),
             ],
         begin:  Alignment.topCenter,
         end:  Alignment.bottomCenter,
         stops: [0.0, 0.3],
         tileMode: TileMode.clamp)
       ),
          child: LoginForm()),
    );
  }

}