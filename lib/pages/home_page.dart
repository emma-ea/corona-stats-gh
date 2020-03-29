import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFFFFFFFF),
        centerTitle: true,
        leading: IconButton(icon: Image.asset('assets/images/menu2.png', width: 34.0, height: 34.0,), onPressed: () {},),
        title: Text('CoronaTracker.Gh', style: TextStyle(color: Color(0xFF0000000), fontWeight: FontWeight.bold,),),
        actions: <Widget>[IconButton(icon: Image.asset('assets/images/help.png', width: 30.0, height: 30.0,), onPressed: () {},),],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 120.0,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0), color: Color(0xFF000000)),
            ),
          ],
        ),
      ),
    );
  }
}