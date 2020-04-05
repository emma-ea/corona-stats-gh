import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: widget.url,
        ),
      ),
    );
  }
}
