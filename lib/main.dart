import 'package:corona_tracker_gh/scoped_model/main.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'pages/main_page.dart';
import 'pages/displacement_menu.dart';
import 'scoped_model/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  final MainModel _model = MainModel();
  AnimationController _controller;

  final int maxSlide = 225;

  @override
  void initState() {
    super.initState();
    
    _model.getData();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
  }

  void toggleMenu() {
    print('toggle');
    _controller.isDismissed ? _controller.forward() : _controller.reverse();
  }

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
      home: ScopedModel<MainModel>(
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
                    child: MainPage(_model, toggleMenu),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
