import 'package:flutter/material.dart';

class NewButton extends StatelessWidget {
  const NewButton(
      {Key? key,
      required this.text,
      required this.imagelink,
      required this.onTap})
      : super(key: key);

  final String text;
  final String imagelink;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.yellow[700]!,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(
                imagelink,
                height: 100,
                width: 100,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
