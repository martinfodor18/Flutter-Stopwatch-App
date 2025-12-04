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
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          return TextStyle(
            color: states.contains(WidgetState.selected)
                ? AppColor.brandGreen
                : AppColor.navBarInactiveItemLight,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          return IconThemeData(
            color: states.contains(WidgetState.selected)
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
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          return TextStyle(
            color: states.contains(WidgetState.selected)
                ? AppColor.brandGreen
                : AppColor.navBarInactiveItemDark,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          return IconThemeData(
            color: states.contains(WidgetState.selected)
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

  static const TextStyle lapItemTotalTimeTextStyle = TextStyle(fontSize: 12);

  static const TextStyle counterLarge = TextStyle(
    fontSize: 45,
    fontWeight: .bold,
    fontFeatures: [.tabularFigures()],
  );

  static const TextStyle counterSmall = TextStyle(
    fontSize: 20,
    fontFeatures: [.tabularFigures()],
  );

  static const TextTheme _textTheme = TextTheme(
    titleLarge: TextStyle(fontSize: 24, fontWeight: .bold, color: AppColor.white),
    labelLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
  );
}
