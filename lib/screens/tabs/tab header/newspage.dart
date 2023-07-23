import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key, required this.newsUrl});
  final String newsUrl;
  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
        body: SafeArea(
          child:   Container(
            height: MediaQuery.of(context).size.height,
            width:  MediaQuery.of(context).size.width,
          child: WebView(
            onWebViewCreated: ((WebViewController webViewController){
              _completer.complete(webViewController);
            }),
            initialUrl: widget.newsUrl,
          ),
             ),
          ),
       
    );
  }
}
