import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:math';

class ProfileImageGradientScreen extends StatelessWidget {
  const ProfileImageGradientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final bool isDarkMode = theme.brightness == Brightness.dark;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SizedBox(
            height: height * 0.40,
            width: width * 0.28,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 50,
                  top: 180,
                  child: Transform.rotate(
                    angle: 90 * pi / 180,
                    child: Image.asset(
                      "images/Elements.png",
                      color: isDarkMode ? Colors.white70 : Colors.black,
                    ),
                  ),
                ),
                Positioned(
                  right: 72,
                  bottom: 35,
                  child: Transform.scale(
                    scaleY: -1,
                    child: CustomPaint(
                      size: const Size(315, 160),
                      painter: GradientSemicirclePainter(),
                    ),
                  ),
                ),
                Positioned(
                  right: 80,
                  bottom: 50,
                  child: ClipOval(
                    child: Image.asset(
                      "images/man.png",
                      height: height * 0.60,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Text(
          "Nitin K. Oberoi",
          style: theme.textTheme.bodyLarge?.copyWith(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Software Engineer based in India",
          style: theme.textTheme.bodySmall?.copyWith(
            fontFamily: "Poppins",
            fontStyle: FontStyle.italic,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}

class GradientSemicirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = ui.Gradient.linear(
        Offset(0, size.height / 2), // Start point
        Offset(size.width, size.height / 2), // End point
        [
          const Color(0xFFFFB75E), // Orange
          const Color(0xFFFF7E7E), // Coral pink
          const Color(0xFFEF5EFF), // Purple
        ],
        [0.0, 0.5, 1.0],
        TileMode.clamp,
      );

    final path = Path();

    // Draw a semi-circle
    path.moveTo(0, size.height);
    path.arcTo(
        Rect.fromLTWH(0, 0, size.width, size.height * 2),
        3.14159, // PI (180 degrees)
        3.14159, // PI (180 degrees)
        false);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
