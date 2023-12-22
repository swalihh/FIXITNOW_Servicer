import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loadingbutton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final bool showloader;

  const Loadingbutton(
      {super.key,
      required this.onPressed,
      this.buttonText = 'Button',
      required this.showloader});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            fixedSize: Size(screenSize.width, screenSize.height / 16)),
        child: showloader
            ? LoadingAnimationWidget.prograssiveDots(
                color: Colors.white, size: 80)
            : Text(
                buttonText,
                style: const TextStyle(fontSize: 18),
              ));
  }
}
