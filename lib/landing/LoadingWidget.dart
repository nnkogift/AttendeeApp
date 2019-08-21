
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Center(
        child: Padding(
          padding: EdgeInsets.only(top: 100.0),
          child: SpinKitWave(
            color: Color(0xFF00BCD4),
          ),
        ),
      );
  }
}
