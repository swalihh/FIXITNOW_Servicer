import 'package:flutter/material.dart';
import 'package:servicer/resources/constants/colors.dart';

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
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                        fixedSize:
                            Size(screenSize.width, screenSize.height / 16)),
                    child:  Text(
                      buttonText,
                      style:const TextStyle(fontSize: 18),
                    ));
  }
}

class CustomAcceptedElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const CustomAcceptedElevatedButton({super.key, 
    required this.onPressed,
    this.buttonText = 'Button',
  });

  @override
  Widget build(BuildContext context) {
        final Size screenSize = MediaQuery.of(context).size;

    return   ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Appcolor.success,
                        fixedSize:
                            Size(screenSize.width, screenSize.height/22)),
                    child:  Text(
                      buttonText,
                      style:const TextStyle(fontSize: 15),
                    ));
  }
}



