import 'package:flutter/material.dart';

import 'screen/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(),
      initialRoute: MyHomePage.id,
      routes: {
        MyHomePage.id: (context) => const MyHomePage(),
        BTranslate.id: (context) => const BTranslate(),
        BBaybayinScreen.id: (context) => const BBaybayinScreen(),
        BHistoryScreen.id: (context) => const BHistoryScreen()
      },
    );
  }
}
