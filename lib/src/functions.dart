import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

void navigate(BuildContext context, Widget Function(BuildContext) builder) {
  Navigator.of(context).push(MaterialPageRoute(builder: builder));
}

void back(BuildContext context) {
  Navigator.of(context).pop();
}

void openUrl(String url) {
  launchUrl(Uri.parse(url));
}

@Deprecated('Use nowa client instead')
Future<Response> httpGet({required String url, Map<String, String>? headers}) {
  return get(Uri.parse(url), headers: headers);
}
