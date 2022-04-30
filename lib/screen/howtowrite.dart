import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BHowtoWrite extends StatelessWidget {
  static const String id = 'WritingBaybayin';
  const BHowtoWrite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('How to write'),
        ),
        body: const WebView(
          initialUrl: 'https://www.youtube.com/watch?v=ddghRtW9LpE',
          javascriptMode: JavascriptMode.unrestricted,
        ));
  }
}
