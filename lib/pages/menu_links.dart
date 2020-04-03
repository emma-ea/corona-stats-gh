import 'package:flutter/material.dart';

class MenuLinks extends StatefulWidget {
  
  final String url;

  MenuLinks({this.url});

  @override
  State<StatefulWidget> createState() {
    return _MenuLinksState();
  }
}

class _MenuLinksState extends State<MenuLinks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text('menu\n${widget.url}'),
      ),
    );
  }
}