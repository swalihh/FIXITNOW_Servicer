import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const CustomElevatedButton({super.key, 
    required this.onPressed,
    this.buttonText = 'Button',
  });

  @override
  Widget build(BuildContext context) {
        final Size screenSize = MediaQuery.of(context).size;

    return   ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        fixedSize:
                            Size(screenSize.width, screenSize.height / 16)),
                    child:  Text(
                      buttonText,
                      style:const TextStyle(fontSize: 18),
                    ));
  }
}
