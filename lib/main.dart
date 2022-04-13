import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testglobiz/screen/home_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.amber.withOpacity(0.9)
  ));
  runApp( TestApp());
}

class TestApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}


