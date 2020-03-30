import 'package:flutter/material.dart';

class DisplacementMenu extends StatefulWidget {
  @override
  _DisplacementMenuState createState() => _DisplacementMenuState();
}

class _DisplacementMenuState extends State<DisplacementMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffc0392b),
      
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xffc0392b),
        title: Padding(
          padding: const EdgeInsets.all(18.0),
        ),
      ),
      body: SingleChildScrollView(
              child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text('Menu', style: TextStyle(color: Colors.white, fontSize: 54.0, fontWeight: FontWeight.bold,),),
              SizedBox(height: 30.0,),
              ListTile(leading: Icon(Icons.healing, color: Colors.white,), title: Text('Stay safe tips', style: TextStyle(color: Colors.white),),),
              ListTile(leading: Icon(Icons.question_answer, color: Colors.white,), title: Text('Frequently Asked \nQuestions', style: TextStyle(color: Colors.white),),),
              ListTile(leading: Icon(Icons.new_releases, color: Colors.white,), title: Text('Press Releases', style: TextStyle(color: Colors.white),),),
              ListTile(leading: Icon(Icons.new_releases, color: Colors.white,), title: Text('Other Releases', style: TextStyle(color: Colors.white),),),
              ListTile(leading: Icon(Icons.info, color: Colors.white,), title: Text('About App', style: TextStyle(color: Colors.white),),),
              //ListTile(leading: Icon(Icons.done), title: Text('Credits'),),
            ],
          ),
        ),
      ),
    );
  }
}