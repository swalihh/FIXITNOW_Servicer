import 'package:flutter/material.dart';
import 'package:servicer/resources/constants/colors.dart';

class TextType {
  static TextStyle get headings => const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontFamily: 'Lato',
    color: Color.fromARGB(255, 0, 0, 0),
  );

  static TextStyle get labels => const TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: 'Lato',
    fontSize: 17,
  );

  static TextStyle get appName => const  TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    
    fontFamily: 'Pacifico', 
    color: Appcolor.secondaryColor, 
  );
}
