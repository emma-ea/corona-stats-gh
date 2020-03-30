import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'pages/main_page.dart';
import 'pages/displacement_menu.dart';
import 'scoped_model/model.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{

  final DataModel _model = DataModel();
  AnimationController _controller;

  int maxSlide = 43;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
  }

  void Toggle() => _controller.isDismissed ? _controller.forward() : _controller.reverse();

  @override
  Widget build(BuildContext context) {
    double slide = maxSlide * _controller.value;
    double scale = 1 - (_controller.value * 0.3);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Nunito',
        backgroundColor: Color(0xFFFFFFFF),
      ),
      home: ScopedModel<DataModel>(
        model: _model,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return Stack(
          children: <Widget>[
            DisplacementMenu(),
            Transform(
              transform: Matrix4.identity()
              ..scale(scale)
              ..translate(slide),
              alignment: Alignment.centerLeft,
              child: MainPage(_model),
            ),
          ],
      );
          }
                
        ),
      ), 
    );
  }

}