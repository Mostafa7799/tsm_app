import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({
    Key? key,
    required this.webLink,
  }) : super(key: key);
  final String webLink;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  final Completer<WebViewController> controller =
  Completer<WebViewController>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: WillPopScope(
        onWillPop: () async {
          if (await _webViewController.canGoBack()) {
            _webViewController.goBack();
            return false;
          } else {
            return true;
          }
        },
        child: SafeArea(
          child: Builder(builder: (BuildContext context) {
            return WebView(
              initialUrl: widget.webLink,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                controller.complete(webViewController);
                _webViewController = webViewController;
              },
              onProgress: (int progress) {
                print('WebView is loading (progress: $progress%)');
              },
              navigationDelegate: (NavigationRequest request) {
                if (request.url.startsWith('https://tsmedu.net')) {
                  print('Blocking navigation to $request');
                  return NavigationDecision.prevent;
                }
                print('Allowing navigation to $request');
                return NavigationDecision.navigate;
              },
              onWebResourceError: (WebResourceError error) {
                print('Web resource error: $error');
              },
              gestureNavigationEnabled: true,
              backgroundColor: const Color(0x00000000),
              geolocationEnabled: true,
              onPageStarted: (String url) {
                print('Page started loading: $url');
              },
              onPageFinished: (String url) {
                print('Page finished loading: $url');
              },
            );
          }),
        ),
      ),
    );
  }
}
