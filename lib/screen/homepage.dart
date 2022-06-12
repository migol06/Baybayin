import 'package:baybayin/screen/screen.dart';
import 'package:baybayin/widgets/newbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatelessWidget {
  static const String id = 'HomePage';
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/homebg.png',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Positioned(
            right: 20,
            child: SafeArea(
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: PopupMenuButton(
                    itemBuilder: (context) => [
                          PopupMenuItem(
                              child: ListTile(
                            title: const Text('Tutorial'),
                            onTap: () {
                              Navigator.pop(context);
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      padding: const EdgeInsets.all(30),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: const [
                                            Text(
                                              'TUTORIAL',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            Text(
                                                '1. After opening the app, the user must select any button; Translate, Baybayin, History, and Exit. When they clicked the Exit button, the application will close.'),
                                            Text(
                                                '2.If the user clicked the Translate button, they will be asked to input or capture the image they want to translate'),
                                            Text(
                                                '3. If the user clicked the Camera button, they have to clearly capture an image, and if they clicked Gallery button, they have to select an image with Baybayin symbol.'),
                                            Text(
                                                '4. When they are done capturing or choosing an image, they can already see and copy the result.'),
                                            Text(
                                                '5. If the user clicked the Baybayin button from the homepage, they will be asked to choose from the buttons; Baybayin letter, How to write, and Back. When they clicked the Back button, they will be brought back to the homepage.'),
                                            Text(
                                                '6. If the user clicked the Baybayin letter button, they can see the Baybayin symbols.'),
                                            Text(
                                                '7. If the user clicked the How to Write button, they can learn the Baybayin symbols through watching on a Youtube video tutorial.'),
                                            Text(
                                                '8. When the user clicked the History button from the homepage, they can read and understand where Baybayin came from.')
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                          ))
                        ]),
              ),
            ),
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
                    const SizedBox(
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
                const SizedBox(
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
                    const SizedBox(
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
