import 'package:flutter/material.dart';



class Utils {
  static String getPNGAssetPath(String value) {
    return 'assets/images/$value.png';
  }

  static ThemeData get appTheme {
    return ThemeData(
      // fontFamily: 'Nunito',
      appBarTheme: const AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
      ),
      canvasColor: Colors.black,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.grey[90],
      ),
    );
  }
  
}