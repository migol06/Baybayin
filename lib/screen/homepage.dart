import 'package:baybayin/screen/screen.dart';
import 'package:baybayin/widgets/buttons.dart';
import 'package:baybayin/widgets/newbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatelessWidget {
  static const String id = 'HomePage';
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Image.asset(
            'assets/images/homebg.png',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NewButton(
                      onTap: () => Navigator.pushNamed(context, BTranslate.id),
                      imagelink: 'assets/images/translate.png',
                      text: 'Translate',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    NewButton(
                      onTap: () =>
                          Navigator.pushNamed(context, BBaybayinScreen.id),
                      imagelink: 'assets/images/tutorial.png',
                      text: 'Baybayin',
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NewButton(
                      onTap: () =>
                          Navigator.pushNamed(context, BHistoryScreen.id),
                      imagelink: 'assets/images/history.png',
                      text: 'History',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    NewButton(
                      onTap: () => SystemNavigator.pop(),
                      imagelink: 'assets/images/exit.png',
                      text: 'Exit',
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
