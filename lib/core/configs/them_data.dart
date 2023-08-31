import 'package:flutter/material.dart';

import 'colors.dart';

class Themings {
  static final ThemeData lighTheme=ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.blue,
    appBarTheme: AppBarTheme(
      toolbarTextStyle: lightText,
      backgroundColor: Colors.white,
      titleTextStyle: const TextStyle(color: Colors.black),
      iconTheme: const IconThemeData(
        color: Colors.black,

      )
    ),
    textTheme: TextTheme(
      bodyLarge: lightText,
      bodyMedium: lightText,
      labelMedium: lightText,
      bodySmall: lightText,
      labelLarge: lightText,
      labelSmall: lightText,
    ),
    scaffoldBackgroundColor: AppColors.lightGrey,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
        .copyWith(background: AppColors.whiteGrey),
  );
  static final TextStyle lightText = TextStyle(
    color: AppColors.black,
  );

}
