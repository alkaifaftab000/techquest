import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText {
  static String homeAppBar = 'TechQuest';
  static String homeCategories = 'Categories';

  TextStyle appTextStyle() {
    return GoogleFonts.poppins(
      textStyle: const TextStyle(
        fontSize: 25, // You can change the size as per your requirement
        fontWeight: FontWeight.bold, // Styling options like bold
        color: Colors.black, // Customize the color
      ),
    );
  }

  static TextStyle appTextStyleBody(double size,
      [FontWeight fontWt = FontWeight.normal, Color color = Colors.black]) {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        fontSize: size, // You can change the size as per your requirement
        fontWeight: fontWt, // Styling options like bold
        color: color, // Customize the color
      ),
    );
  }
}
