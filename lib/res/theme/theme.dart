import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.purple,
      backgroundColor: Colors.white,
      accentColor: Colors.black,
      errorColor: const Color(0xb00020),
      brightness: Brightness.light,


    ),
        useMaterial3: true,
  );


}
