import 'package:flutter/material.dart';
import 'package:servicer/resources/constants/fonts.dart';

class CustomInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const CustomInfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$label :',
          style: TextType.smallLabels,
        ),
        Text(
          value,
          style: TextType.smallLabels,
        ),
      ],
    );
  }
}
