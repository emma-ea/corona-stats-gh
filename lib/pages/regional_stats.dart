import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'dart:math' as math;
import 'package:scoped_model/scoped_model.dart';

import '../scoped_model/model.dart';
import '../model/data_model.dart';

class RegionalStats extends StatefulWidget {
  @override
  _RegionalStatsState createState() => _RegionalStatsState();
}

class _RegionalStatsState extends State<RegionalStats> {
  math.Random random = math.Random();

  List<double> _generateData(List<CasesModel> count) {
    List<double> result = <double>[];
    count.forEach((f) {
      result.add(f.totalCases.toDouble());
    });
    return result;
  }

  Widget _buildChart(List<CasesModel> allCases) {
    var data = _generateData(allCases);
    return Sparkline(
      data: data,
      pointsMode: PointsMode.all,
      pointSize: 8.0,
    );
  }

  Widget _regionCasesBuilder() {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width/2,
      decoration: BoxDecoration(color: Color(0xff34495e), borderRadius: BorderRadius.circular(12.0),),
      child: Column(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Color(0xffecf0f1),
              ),
              height: 300.0,
              child: ScopedModelDescendant(builder: (BuildContext context, Widget child, DataModel model) {
                return _buildChart(model.getAllCases);
              }),
            ),
            Text(
                '*Chart Shows Relation Between Days(Vertical) and Cases(Horizontal)',
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.black,
                ),
              ),
            SizedBox(height: 20.0,),
            Text('Cases From Regions', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
            SizedBox(height: 20.0,),
            FittedBox(
                          child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _regionCasesBuilder(),
                  SizedBox(width: 6.0,),
                  _regionCasesBuilder()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
