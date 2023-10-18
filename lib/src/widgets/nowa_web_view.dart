import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_universal/webview_universal.dart';

class NowaWebView extends StatefulWidget {
  const NowaWebView({required this.url, super.key});

  final String url;

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
      return const WebViewPlaceholder(
        text: 'WebView is is only supported on Android, iOS and Web.',
      );
    }

    return WebView(controller: webViewController);
  }
}

class WebViewPlaceholder extends StatelessWidget {
  const WebViewPlaceholder({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    const boxColor = Color(0xFFE0E9F1);

    return Container(
      decoration: const BoxDecoration(color: Color(0xFFEEF7FF)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SizedBox(
                  width: 600,
                  height: 800,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Container(height: 32, width: 32, color: boxColor),
                          const Spacer(),
                          Container(height: 32, width: 200, color: boxColor),
                        ],
                      ),
                      const SizedBox(height: 64),
                      Center(
                        child: Container(
                          height: 250,
                          width: 250,
                          color: const Color(0xFFAFE1FC),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(height: 24, color: boxColor),
                      const SizedBox(height: 16),
                      Container(height: 24, color: boxColor),
                      const SizedBox(height: 16),
                      Container(height: 24, color: boxColor),
                      const SizedBox(height: 16),
                      Container(height: 24, color: boxColor),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          Expanded(
                            child: Container(height: 224, color: boxColor),
                          ),
                          const SizedBox(width: 32),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  height: 24,
                                  width: 200,
                                  color: boxColor,
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  height: 24,
                                  width: 200,
                                  color: boxColor,
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  height: 24,
                                  width: 200,
                                  color: boxColor,
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  height: 24,
                                  width: 200,
                                  color: boxColor,
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  height: 24,
                                  width: 200,
                                  color: boxColor,
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  height: 24,
                                  width: 200,
                                  color: boxColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF7B9CCF),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
