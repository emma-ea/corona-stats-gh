import 'package:flutter/material.dart';

import '../about_text_corona.dart';

class AboutCovid19 extends StatefulWidget {
  @override
  _AboutCovid19State createState() => _AboutCovid19State();
}

class _AboutCovid19State extends State<AboutCovid19> {

  AboutInfo aboutInfo = AboutInfo();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
            SizedBox(height: 20.0,),
            Text('${aboutInfo.headerTitle}', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
            Text('${aboutInfo.headerDetail}', textAlign: TextAlign.justify,),

            SizedBox(height: 20.0,),
            Container(
              height: 2.0,
              decoration: BoxDecoration(color: Color(0xffc0392b)),
            ),
            SizedBox(height: 10.0,),
            Text('${aboutInfo.howTitle}', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
            Text('${aboutInfo.howDetail}', textAlign: TextAlign.justify,),

            SizedBox(height: 20.0,),
            Container(
              height: 2.0,
              decoration: BoxDecoration(color: Color(0xffc0392b)),
            ),
            SizedBox(height: 10.0,),
            Text('${aboutInfo.signSymptomsTitle}', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
            Text('${aboutInfo.signsSymptomsDetail}', textAlign: TextAlign.justify,),

            SizedBox(height: 20.0,),
            Container(
              height: 2.0,
              decoration: BoxDecoration(color: Color(0xffc0392b)),
            ),
            SizedBox(height: 10.0,),
            Text('${aboutInfo.preventionTitle}', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
            Text('${aboutInfo.preventionDetail}', textAlign: TextAlign.justify,),

            SizedBox(height: 20.0,),
            Container(
              height: 2.0,
              decoration: BoxDecoration(color: Color(0xffc0392b)),
            ),
            SizedBox(height: 10.0,),
            Text('${aboutInfo.treatmentTitle}', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
            Text('${aboutInfo.treatmentDetail}', textAlign: TextAlign.justify,),
            
            SizedBox(height: 20.0,)
        ],
      ),
          ),
    );
  }
}