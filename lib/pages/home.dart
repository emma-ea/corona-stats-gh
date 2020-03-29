import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String cases = NumberFormat().format(3332);

  Widget _buildTotalCases() {
    return Container(
              height: 120.0,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 8.0, ),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0), color: Color(0xFFC0392B)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(height: 4.0,),
              Text('Total Confirm Cases', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF), fontSize: 18.0, ),),
              Text('$cases', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF), fontSize: 42.0, ),),
              Text('Date: 23th Match 2020, 19:34:33 GMT', style: TextStyle(color: Color(0xFFFFFFFF),),),
                ],
              ),
            );
  }

  Widget _buildOtherStats() {
    return Container(
              height: 170.0,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 8.0, ),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0), color: Color(0xFF2C3E50)),
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
                            Text('Cases Today',  style: TextStyle(color: Color(0xff2ecc71), fontWeight: FontWeight.bold,), ),
                            Text('11',  style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold,), ),
                          ],
                        ),
                      ),

                      Container(
                    
                        width: 100,
                        child: Column(
                          children: <Widget>[
                            Text('Deaths Today',  style: TextStyle(color: Color(0xFFFFFFFF),), ),
                            Text('11',  style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold,), ),
                          ],
                        ),
                      ),

                      Container(
                     
                        width: 100,
                        child: Column(
                          children: <Widget>[
                            Text('Recovered',  style: TextStyle(color: Color(0xFFFFFFFF),), ),
                            Text('11',  style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold,), ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                     
                        width: 100,
                        child: Column(
                          children: <Widget>[
                            Text('Active',  style: TextStyle(color: Color(0xFFFFFFFF),), ),
                            Text('11',  style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold,), ),
                          ],
                        ),
                      ),
                      
                      Container(
                     
                        width: 100,
                        child: Column(
                          children: <Widget>[
                            Text('Critical',  style: TextStyle(color: Color(0xFFFFFFFF),), ),
                            Text('11',  style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold,), ),
                          ],
                        ),
                      ),

                      Container(
                      
                        width: 100,
                        child: Column(
                          children: <Widget>[
                            Text('Deaths',  style: TextStyle(color: Color(0xFFFFFFFF),), ),
                            Text('11',  style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold,), ),
                          ],
                        ),
                      ),
                    ],),
                ],
              ),
            );
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 12.0,),
            _buildTotalCases(),
            SizedBox(height: 10.0,),
            _buildOtherStats(),
          ],
        ),
      );
  }
}