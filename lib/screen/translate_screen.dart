import 'dart:io';

import 'package:baybayin/widgets/textare.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:clipboard/clipboard.dart';
import '../widgets/widgets.dart';
import 'package:tflite/tflite.dart';

class BTranslate extends StatefulWidget {
  static const String id = 'BTranslate';
  const BTranslate({Key? key}) : super(key: key);

  @override
  State<BTranslate> createState() => _BTranslateState();
}

class _BTranslateState extends State<BTranslate> {
  bool hasImage = false;
  File? image;
  String result = '';

  loadModel() async {
    await Tflite.loadModel(
        model: "assets/model/Dataset.tflite", //Put the model here
        labels: "assets/model/Dataset.txt", // Put the model label here
        numThreads: 1, // defaults to 1
        isAsset:
            true, // defaults to true, set to false to load resources outside assets
        useGpuDelegate:
            false // defaults to false, set to true to use GPU delegate
        );
  }

  Future<void> processImage() async {
    var recognitions = await Tflite.runModelOnImage(
        path: image!.path, // required
        imageMean: 0.0, // defaults to 117.0
        imageStd: 255.0, // defaults to 1.0
        numResults: 2, // defaults to 5
        threshold: 0.2, // defaults to 0.1
        asynch: true // defaults to true
        );

    for (var output in recognitions!) {
      debugPrint(output.toString());
      if (mounted) {
        setState(() {
          result = output.toString();
        });
      }
    }
  }

  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
        hasImage = true;
        processImage();
      });
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

  void copyToClipBoard() {
    if (result.trim() != '') {
      FlutterClipboard.copy(result);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Copy Text"),
      ));
    }
  }

  @override
  void initState() {
    loadModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Translate'),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/translatebg.png',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              BImageContainer(
                  child: hasImage ? Image.file(image!) : const BBlankImageBox(),
                  onTapCamera: () {
                    getImage(ImageSource.camera);
                    Navigator.pop(context);
                  },
                  onTapGallery: () {
                    getImage(ImageSource.gallery);
                    Navigator.pop(context);
                  }),
              const SizedBox(
                height: 10,
              ),
              BTextArea(
                  text: result,
                  onTap: () {
                    copyToClipBoard();
                  })
            ],
          ),
        ],
      ),
    );
  }
}

class BBlankImageBox extends StatelessWidget {
  const BBlankImageBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.image_outlined,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'Click to input image, \nMax file size 10MB, Minimum \nResolution 1024 x 1024',
        )
      ],
    );
  }
}
