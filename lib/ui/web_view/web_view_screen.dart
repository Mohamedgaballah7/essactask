import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String url;
   const WebViewScreen ({super.key,required this.url});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
   late WebViewController _controller;
   int loadingPercentage=0;
  @override
  void initState() {
    // TODO: implement initState
    _initializeWebView();
    super.initState();
  }
  void _initializeWebView(){
    _controller=WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ))
      ..loadRequest(Uri.parse(widget.url));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          WebViewWidget(
              controller: _controller
          ),
          if(loadingPercentage<100)
            LinearProgressIndicator(
              value: loadingPercentage / 100,
            ),

        ],
      ),
    );
  }
}
