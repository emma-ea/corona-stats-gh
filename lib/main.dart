import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'pages/main_page.dart';
import 'pages/displacement_menu.dart';
import 'scoped_model/model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final DataModel _model = DataModel();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Nunito',
        backgroundColor: Color(0xFFFFFFFF),
      ),
      home: ScopedModel<DataModel>(
        model: _model,
        child: Stack(
        children: <Widget>[
          DisplacementMenu(),
          MainPage(_model),
        ],
      ),
      ), 
    );
  }

}