import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scoped_model/scoped_model.dart';

import '../scoped_model/model.dart';
import '../model/data_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String img1 = 'https://www.who.int/images/default-source/health-topics/coronavirus/safe-greetings.png';
  String img2 = 'https://www.who.int/images/default-source/health-topics/coronavirus/handshaking.png';
  String img3 = 'https://www.who.int/images/default-source/health-topics/coronavirus/wearing-gloves.png';

  Widget _buildTotalCases(CasesModel caseData) {
    String cases = NumberFormat().format(caseData.totalCases).toString();
    String timeDate = caseData.timeStamp.replaceFirst(new RegExp(r'T'), ' Time: ');
    return Container(
      height: 170.0,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: Color(0xFFC0392B)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            height: 4.0,
          ),
          Text(
            'Total Confirm Cases',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFFFFF),
              fontSize: 18.0,
            ),
          ),
          Text(
            '$cases',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFFFFF),
              fontSize: 52.0,
            ),
          ),
          Text(
            'Updated on Date: $timeDate',
            style: TextStyle(
              color: Color(0xFFFFFFFF),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOtherStats(CasesModel caseData) {
    return Container(
      height: 170.0,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: Color(0xFF2C3E50)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 100,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Cases Today',
                      style: TextStyle(
                        color: Color(0xff2ecc71),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${caseData.casesToday}',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 100,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Deaths Today',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    Text(
                      '${caseData.deathsToday}',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 100,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Recovered',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    Text(
                      '${caseData.recovered}',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 100,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Active',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    Text(
                      '${caseData.active}',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 100,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Critical',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    Text(
                      '${caseData.critical}',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 100,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Deaths',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    Text(
                      '${caseData.totalDeaths}',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _imagerLoader(BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
        if (loadingProgress == null)
          return child;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                  : null,
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
        builder: (BuildContext context, Widget child, DataModel model) {
      Widget page = Container(child: Center(child: Text("Failed to get data..."),),);
      if (model.isLoading) {
        return Center( child: CircularProgressIndicator(backgroundColor: Color(0xffc0392b),));
      }  else if ( !model.isLoading && model.currentCase.totalCases > 0) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 12.0,
              ),
              _buildTotalCases(model.currentCase),
              SizedBox(
                height: 10.0,
              ),
              _buildOtherStats(model.currentCase),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                child: Text('Emergency Lines:', style: TextStyle( color: Color(0xffc0392b), fontWeight: FontWeight.bold, fontSize: 20.0),),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(leading: Icon(Icons.call,), title: Text('112'),),
                    ListTile(leading: Icon(Icons.call,), title: Text('+233 55 843 9868'),),
                    ListTile(leading: Icon(Icons.call,), title: Text('+233 50 949 7700'),),
            
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                child: Text('Advice from the World Health Organisation', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 20.0),),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Image.network(img1, loadingBuilder: _imagerLoader,),
                    Image.network(img2, loadingBuilder: _imagerLoader, ),
                    Image.network(img3, loadingBuilder: _imagerLoader, ),
                  ],
                ),
              )
            ],
          ),
        );
      }
      else {
        return page;
      }
    });
  }
}
