import 'package:flutter/material.dart';

class DescriptionTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Icon? prefixIcon;
  final String? hintText;
  final String? Function(String?)? validator;
  final String? label;
  final TextStyle? labelStyle;
  final bool obscureText;
  final TextInputType keyboardType;
  final int? maxLines;
  final int? maxLength;

  const DescriptionTextField({
    Key? key,
    this.controller,
    this.prefixIcon,
    this.hintText,
    this.validator,
    this.label,
    this.labelStyle,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLines, 
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: labelStyle,
          ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
         // obscureText: obscureText,
          keyboardType: keyboardType,
          maxLines: maxLines, 
          maxLength: maxLength, 
          style: const TextStyle(
            color: Colors.black,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor:const Color.fromARGB(255, 224, 224, 224),
            prefixIcon: prefixIcon,
            hintText: hintText,
            border:const OutlineInputBorder(),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
