import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'GoogleSansFlex',

      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColor.brandGreen,
        brightness: Brightness.light,
      ),

      textTheme: _textTheme,
      scaffoldBackgroundColor: AppColor.backgroundLight,
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColor.navBarBackgroundLight,
        indicatorColor: Colors.transparent,
        labelTextStyle: MaterialStateProperty.resolveWith((states) {
          return TextStyle(
            color: states.contains(MaterialState.selected)
                ? AppColor.brandGreen
                : AppColor.navBarInactiveItemLight,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          );
        }),
        iconTheme: MaterialStateProperty.resolveWith((states) {
          return IconThemeData(
            color: states.contains(MaterialState.selected)
                ? AppColor.brandGreen
                : AppColor.navBarInactiveItemLight,
            size: 26,
          );
        }),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: 'GoogleSansFlex',

      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColor.brandGreen,
        brightness: Brightness.dark,
      ),

      textTheme: _textTheme,
      scaffoldBackgroundColor: AppColor.backgroundDark,
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColor.navBarBackgroundDark,
        indicatorColor: Colors.transparent,
        labelTextStyle: MaterialStateProperty.resolveWith((states) {
          return TextStyle(
            color: states.contains(MaterialState.selected)
                ? AppColor.brandGreen
                : AppColor.navBarInactiveItemDark,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          );
        }),
        iconTheme: MaterialStateProperty.resolveWith((states) {
          return IconThemeData(
            color: states.contains(MaterialState.selected)
                ? AppColor.brandGreen
                : AppColor.navBarInactiveItemDark,
            size: 26,
          );
        }),
      ),
    );
  }

  static const TextStyle lapItemLapTimeTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle lapItemTotalTimeTextStyle = TextStyle(
    fontSize: 12,
  );

  static const TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 56,
      fontWeight: FontWeight.w700,
    ),
    displayMedium: TextStyle(
      fontSize: 42,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      height: 1.2,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      height: 1.2,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
  );
}