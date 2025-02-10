import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  // Light Theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Appcolors.primaryLight,
    scaffoldBackgroundColor: Appcolors.backgroundLight,
    fontFamily: 'Ubuntu',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'Ubuntu',
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Appcolors.textLight,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Ubuntu',
        fontSize: 30,
        color: Appcolors.textLight,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Ubuntu',
        fontSize: 24,
        color: Appcolors.textLight,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Ubuntu',
        fontSize: 20,
        color: Appcolors.textLight,
      ),
    ),
    elevatedButtonTheme: AppTheme.elevatedButtonTheme(Appcolors.accentLight),
    dividerColor: Appcolors.dividerColor,
    extensions: <ThemeExtension<dynamic>>[
      CustomColors(containerColor: Appcolors.containerLight),
    ],
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Appcolors.primaryDark,
    scaffoldBackgroundColor: Appcolors.backgroundDark,
    fontFamily: 'Ubuntu',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'Ubuntu',
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Appcolors.textDark,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Ubuntu',
        fontSize: 30,
        color: Appcolors.textDark,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Ubuntu',
        fontSize: 24,
        color: Appcolors.textDark,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Ubuntu',
        fontSize: 20,
        color: Appcolors.textDark,
      ),
    ),
    elevatedButtonTheme: AppTheme.elevatedButtonTheme(Appcolors.accentDark),
    dividerColor: Appcolors.dividerColor,
    extensions: <ThemeExtension<dynamic>>[
      CustomColors(containerColor: Appcolors.containerDark),
    ],
  );

  // Extracted Elevated Button Theme for consistency
  static ElevatedButtonThemeData elevatedButtonTheme(Color backgroundColor) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

// Custom Theme Extension to hold extra colors
class CustomColors extends ThemeExtension<CustomColors> {
  final Color? containerColor;

  CustomColors({this.containerColor});

  @override
  CustomColors copywith({Color? containerColor}) {
    return CustomColors(
      containerColor: containerColor ?? this.containerColor,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;
    return CustomColors(
      containerColor: Color.lerp(containerColor, other.containerColor, t),
    );
  }

  @override
  ThemeExtension<CustomColors> copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }
}
