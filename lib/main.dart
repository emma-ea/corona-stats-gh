import 'package:corona_tracker_gh/scoped_model/main.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'pages/main_page.dart';
import 'pages/displacement_menu.dart';
import 'scoped_model/main.dart';

import 'scrapper/scrape_page.dart' as ScrapePage2;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  final MainModel _model = MainModel();
 



  ScrapePage2.ScrapePage scrapeP = ScrapePage2.ScrapePage();

  @override
  void initState() {
    super.initState();
    _model.getData();    //_model.getRegionsData();
    //scrapeP.getData();
    
  }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Nunito',
        backgroundColor: Color(0xFFFFFFFF),
      ),
      home: ScopedModel<MainModel>(
        model: _model,
        child: Stack(
                children: <Widget>[
                  DisplacementMenu(),
                    MainPage(_model),
                  
                ]),
    ),
    );
  }
}
