import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.blue,
      backgroundColor: Colors.white,
      accentColor: Colors.black,
      errorColor: Colors.red[900],
      brightness: Brightness.light,


    ),
        useMaterial3: true,
  );


}
