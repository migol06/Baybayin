import 'package:flutter/material.dart';

class BHistoryScreen extends StatelessWidget {
  static const String id = 'BHistoryScreen';
  const BHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('History')),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/historybg.png',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Put the information inside the text
                Text('Lorem Ipsum Dolor'),
                SizedBox(
                  height: 10,
                ),
                Text('Lorem Ipsum Dolor'),
                SizedBox(
                  height: 10,
                ),
                Text('Lorem Ipsum Dolor'),
                SizedBox(
                  height: 10,
                ),
                Text('Lorem Ipsum Dolor'),
                SizedBox(
                  height: 10,
                ),
                Text('Lorem Ipsum Dolor'),
                SizedBox(
                  height: 10,
                ),
                Text('Lorem Ipsum Dolor'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
