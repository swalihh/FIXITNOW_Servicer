import 'package:flutter/material.dart';

class TextType {
  static TextStyle get headings => const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      fontFamily: 'Lato',
      color: Color.fromARGB(255, 0, 0, 0));

  static TextStyle get labels =>
      const TextStyle(fontWeight: FontWeight.w500,
      fontFamily: 'Lato',
       fontSize: 17);
}
