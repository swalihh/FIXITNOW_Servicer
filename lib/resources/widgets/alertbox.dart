import 'package:flutter/material.dart';
import 'package:servicer/resources/constants/colors.dart';

// ignore: must_be_immutable
class CustomAlertDialogWidget extends StatelessWidget {
  CustomAlertDialogWidget(
      {super.key,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.text4,
      required this.onPressFunction});
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  VoidCallback onPressFunction;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        text1,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        text2,
        style: const TextStyle(color: Color(0xFF6D6D6D)),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            text3,
            style: const TextStyle(
              color: Color.fromARGB(255, 138, 135, 135),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: onPressFunction,
          
          child: Text(
            text4,
            style: const TextStyle(
              color: Appcolor.primerycolor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: Colors.white,
      elevation:5,
);
}
}
