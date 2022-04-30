import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BHistoryScreen extends StatelessWidget {
  static const String id = 'BHistoryScreen';
  const BHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('History')),
      body: const WebView(
        initialUrl:
            'https://alioshabielenberg.com/baybayin-and-nationalism/#:~:text=Baybayin%20is%20a%20writing%20system,at%20least%20the%20eighteenth%20century.&text=The%20word%20baybay%20means%20%E2%80%9Cto,written%20with%20the%20baybayin%20script',
      ),
    );
  }
}
