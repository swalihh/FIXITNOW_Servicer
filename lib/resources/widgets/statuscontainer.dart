import 'package:flutter/material.dart';
import 'package:servicer/resources/constants/fonts.dart';

class StatusCard extends StatelessWidget {
  final String text;
  final Color backgroundColor;

  const StatusCard({
    super.key,
    required this.text,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width * 0.4,
      height: screenSize.height * 0.04,
      decoration: BoxDecoration(
          color:backgroundColor,
           borderRadius: BorderRadius.circular(3)),
      child: Center(
          child: Text(
        text,
        style: TextType.xSmall,
      )),
    );
  }
}
