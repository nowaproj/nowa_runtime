import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_universal/webview_universal.dart';

class NowaWebView extends StatefulWidget {
  final String url;
  const NowaWebView({required this.url, super.key});

  @override
  State<NowaWebView> createState() => _NowaWebViewState();
}

class _NowaWebViewState extends State<NowaWebView> {
  WebViewController webViewController = WebViewController();

  bool _isSupported = true;

  @override
  void initState() {
    super.initState();
    task();
  }

  Future<void> task() async {
    if (!kIsWeb) {
      if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        _isSupported = false;
      }
    }

    if (!_isSupported) return;
    await webViewController.init(
      context: context,
      setState: setState,
      uri: Uri.parse(widget.url),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!_isSupported) {
      return const Placeholder(
        child: Text('WebView is is only supported on Android, iOS and Web.'),
      );
    }

    return WebView(controller: webViewController);
  }
}
