import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:servicer/resources/constants/colors.dart';

class TextType { 
  static TextStyle get headings => const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontFamily: 'Lato',
    color: Color.fromARGB(255, 0, 0, 0),
  );
   static TextStyle get head => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'Lato',
    color: Color.fromARGB(255, 0, 0, 0),
  );

  static TextStyle get labels => const TextStyle(
    fontWeight: FontWeight.w500,
    color: Appcolor.secondaryColor,
     fontSize: 18,
  );
    static TextStyle get smallLabels => const TextStyle(
    fontWeight: FontWeight.w500,
    color: Appcolor.secondaryColor,
     fontSize: 15,
  );

  static TextStyle get appName =>    GoogleFonts.silkscreen(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color:Colors.black
      );
       static TextStyle get xSmall => const TextStyle(
        fontSize: 11.5,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
        color:Appcolor.backgroundColor
      );
  static TextStyle get smallWhite => const TextStyle(
        fontSize: 14,
        color:Appcolor.backgroundColor,
        fontWeight: FontWeight.w700
      );
        static TextStyle get averagewhite => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color:Appcolor.backgroundColor
      );


       static TextStyle get labeltext => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color:Appcolor.backgroundColor
      );
         static TextStyle get smallabeltext => const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color:Appcolor.backgroundColor
      );
         static TextStyle get labeltextbig => const TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.w500,
        color:Appcolor.backgroundColor
      );
  // static TextStyle get smallLight => const TextStyle(
  //       fontSize: 12,
  //       color: AppColor.textSecondary,
  //     );
  static TextStyle get    mediumWhite => const TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.w600,
        color:Appcolor.backgroundColor
      );
  // static TextStyle get mediumLight => const TextStyle(
  //       fontSize: 14,
  //       fontWeight: FontWeight.w500,
  //       color: Colors.white,
  //     );
  static TextStyle get largeDark => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color:Appcolor.backgroundColor
      );
  // static TextStyle get largeLight => const TextStyle(
  //       fontSize: 16,
  //       fontWeight: FontWeight.w600,
  //       color: Colors.white,
  //     );
  static TextStyle get xLarge => const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w600,
        color:Appcolor.backgroundColor
      );
       static TextStyle get button => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color:Appcolor.backgroundColor
      );
            static TextStyle get incontainer => const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color:Appcolor.backgroundColor
      );

         static TextStyle get appname =>  GoogleFonts.silkscreen(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color:Appcolor.backgroundColor
      );
}
