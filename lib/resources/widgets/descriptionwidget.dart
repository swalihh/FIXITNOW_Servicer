
import 'package:flutter/material.dart';
import 'package:servicer/resources/constants/colors.dart';
import 'package:servicer/resources/constants/fonts.dart';

class CustomViewTextField extends StatelessWidget {
  final String labelText;
  final int? maxLength;
  final int? minLength;
  final int? maxLines;
  final ValueNotifier<TextEditingController> controller;
  final IconData? prefixIcon;
  const CustomViewTextField({
    Key? key,
    required this.labelText,

    this.maxLength,
    this.minLength,
    this.maxLines,
    required this.controller,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style:TextType.head
        ),
        ValueListenableBuilder(
          valueListenable: controller,
          builder: (context, value, child) => 
           TextFormField(
            readOnly: true,
            maxLines: maxLines,
            maxLength: maxLength,
            controller: controller.value,
            style: const TextStyle(color: Appcolor.errorcolor),
            decoration: InputDecoration(
              prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: Appcolor.errorcolor) : null,
              fillColor: Appcolor.backgroundColor,
              filled: true,
            ),
          ),
        ),
      ],
    );
  }
}
