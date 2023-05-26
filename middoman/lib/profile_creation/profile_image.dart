import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final void Function()? onPressed;
  final ImageProvider<Object>? backgroundImage;
  final Widget? child;

  const ProfileImage({
    required this.onPressed,
    required this.backgroundImage,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(children: [
        CircleAvatar(
          radius: 90,
          backgroundImage: backgroundImage,
          backgroundColor: Colors.white,
          child: child,
        ),
        Positioned(
          bottom: 1,
          right: 1,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.white,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  50,
                ),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(2, 4),
                  color: Colors.black.withOpacity(
                    0.3,
                  ),
                  blurRadius: 3,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: IconButton(
                icon: const Icon(
                  Icons.photo_camera,
                ),
                tooltip: "Change Profile Picture",
                iconSize: 30,
                color: Colors.black,
                onPressed: onPressed,
              ),
            ),
          ),
        ),
      ])
    ]);
  }
}
