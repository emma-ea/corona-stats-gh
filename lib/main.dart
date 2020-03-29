import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/displacement_menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Nunito',
        backgroundColor: Color(0xFFFFFFFF),
      ),
      home: Stack(
        children: <Widget>[
          DisplacementMenu(),
          HomePage(),
        ],
      ),
    );
  }

}