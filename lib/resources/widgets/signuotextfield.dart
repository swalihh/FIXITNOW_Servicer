import 'package:flutter/material.dart';

class SignUpTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Icon? prefixIcon;
  final String? hintText;
  final String? Function(String?)? validator;
  final String? label;
  final TextStyle? labelStyle;
  final bool obscureText;
  final TextInputType keyboardType;

  const SignUpTextField({
    Key? key,
    this.controller,
    this.prefixIcon,
    this.hintText,
    this.validator,
    this.label,
    this.labelStyle,
    this.obscureText = false,
    this.keyboardType = TextInputType.text, // Default keyboardType is text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: labelStyle, // Apply the labelStyle if provided
          ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: const TextStyle(
            color: Colors.black,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(255, 224, 224, 224),
            prefixIcon: prefixIcon,
            hintText: hintText,
            border: OutlineInputBorder(),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
