import 'package:baybayin/screen/screen.dart';
import 'package:flutter/material.dart';

import '../widgets/buttons.dart';

class BBaybayinScreen extends StatelessWidget {
  static const String id = 'BBaybayin';
  const BBaybayinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Stack(children: [
      Image.asset(
        'assets/images/baybayinbg.png',
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BButtons(
              name: 'Baybayin letter',
              onTap: () {
                Navigator.of(context).pushNamed(BBaybayinLetter.id);
              },
              buttonColor: Colors.grey,
            ),
            const SizedBox(
              height: 15,
            ),
            BButtons(
              name: 'How to write',
              onTap: () {
                Navigator.of(context).pushNamed(BHowtoWrite.id);
              },
              buttonColor: Colors.grey,
            ),
            const SizedBox(
              height: 15,
            ),
            BButtons(
              name: 'Back',
              onTap: () {
                Navigator.pop(context);
              },
              buttonColor: Colors.grey,
            )
          ],
        ),
      )
    ]));
  }
}
