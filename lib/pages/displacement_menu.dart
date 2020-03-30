import 'package:flutter/material.dart';

class DisplacementMenu extends StatefulWidget {
  @override
  _DisplacementMenuState createState() => _DisplacementMenuState();
}

class _DisplacementMenuState extends State<DisplacementMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text('Stay safe tips'),
            Text('Frequently Asked Questions'),
            Text('Press Releases'),
            Text('Other Releases'),
            Text('About App'),
            Text('Credits'),
          ],
        ),
      ),
    );
  }
}