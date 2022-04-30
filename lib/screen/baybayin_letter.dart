import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BBaybayinLetter extends StatelessWidget {
  static const String id = 'Baybayinletter';
  const BBaybayinLetter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Baybayin Letter'),
      ),
      body: const WebView(initialUrl: 'https://i.redd.it/j5s70ivi4bt71.jpg'),
    );
  }
}
