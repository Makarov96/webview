import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Mysinglepage(),
    );
  }
}

class Mysinglepage extends StatelessWidget {

  String pathDirection = 'assets/test.html';
  WebViewController _webViewController;
 Mysinglepage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: WebView(
            initialUrl: '',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController){
              _webViewController=webViewController;
              _loadHtmlFromAssets();
            },
          )
        )
    );
  }
  _loadHtmlFromAssets() async{
      String fileHtmlContents = await rootBundle.loadString(pathDirection );
      _webViewController.loadUrl(Uri.dataFromString(fileHtmlContents, mimeType: 'text/html', 
      encoding: Encoding.getByName('utf-8')).toString());
  }
}