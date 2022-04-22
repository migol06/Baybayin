import 'package:flutter/material.dart';

class BImageContainer extends StatefulWidget {
  final Widget child;
  final VoidCallback onTapCamera;
  final VoidCallback onTapGallery;
  const BImageContainer(
      {Key? key,
      required this.child,
      required this.onTapCamera,
      required this.onTapGallery})
      : super(key: key);

  @override
  State<BImageContainer> createState() => _BImageContainerState();
}

class _BImageContainerState extends State<BImageContainer> {
  Column _bottomSheet(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Camera'),
            onTap: widget.onTapCamera),
        ListTile(
            leading: const Icon(Icons.photo_album),
            title: const Text('Gallery'),
            onTap: widget.onTapGallery)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                child: _bottomSheet(context),
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 2,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey, width: 4),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: widget.child,
        ),
      ),
    );
  }
}
