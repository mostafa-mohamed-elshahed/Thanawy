import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebScreenView extends StatelessWidget {
 var url;
WebScreenView(this.url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: WebView(
        initialUrl: url!,
        allowsInlineMediaPlayback: true,debuggingEnabled:true,gestureNavigationEnabled: true,

      ),
    );
  }
}
