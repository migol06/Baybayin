import 'package:baybayin/screen/screen.dart';
import 'package:baybayin/widgets/buttons.dart';
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
                BButtons(
                    buttonColor: Colors.yellow[700]!,
                    name: 'Translate',
                    onTap: () {
                      Navigator.pushNamed(context, BTranslate.id);
                    }),
                const SizedBox(
                  height: 15,
                ),
                BButtons(
                  name: 'Baybayin',
                  onTap: () {
                    Navigator.pushNamed(context, BBaybayinScreen.id);
                  },
                  buttonColor: Colors.yellow[700]!,
                ),
                const SizedBox(
                  height: 15,
                ),
                BButtons(
                  name: 'History',
                  onTap: () {
                    Navigator.pushNamed(context, BHistoryScreen.id);
                  },
                  buttonColor: Colors.yellow[700]!,
                ),
                const SizedBox(
                  height: 15,
                ),
                BButtons(
                  name: 'Exit',
                  onTap: () {
                    SystemNavigator.pop();
                  },
                  buttonColor: Colors.yellow[700]!,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
