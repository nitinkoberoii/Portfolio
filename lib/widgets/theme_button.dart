import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Tooltip(
      message: "Toggle Theme",
      waitDuration: const Duration(milliseconds: 1500),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFA567), // Orange
              Color(0xFFFD7D7D), // Coral
              Color(0xFFAA50F8), // Purple
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.0, 0.5, 1.0],
            tileMode: TileMode.repeated,
          ),
        ),
        child: IconButton(
          onPressed: () => themeProvider.toggleTheme(),
          icon: const Icon(
            Icons.color_lens,
            color: Colors.white,
            size: 25,
          ),
        ),
      ),
    );
  }
}
