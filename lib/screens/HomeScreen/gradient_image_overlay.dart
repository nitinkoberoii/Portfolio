import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class GradientImageOverlay extends StatelessWidget {
  const GradientImageOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // --------------- bottom-most layer --------------------
          Positioned(
            top: 120, //50
            left: -30,
            child: CustomPaint(
              size: const Size(300, 160),
              painter: HalfOvalPainter(isTop: true, rotationAngle: -30),
            ),
          ),
          Positioned(
            bottom: 5,
            right: -60,
            child: CustomPaint(
              size: const Size(300, 160),
              painter: HalfOvalPainter(isTop: false, rotationAngle: -30),
            ),
          ),

          // ------------ second layer --------------------------
          Positioned(
            top: -220,
            child: ClipRRect(
              child: Image.asset(
                "images/G2_1.png",
                height: 1000,
                scale: 0.63,
              ),
            ),
          ),

          // ------------------- top-most layer -------------------------
          // ----------- star and dotted-box -----------------------------
          Positioned(
            left: 0,
            bottom: 150,
            child: Image.asset(
              "images/star3.png",
              width: 20,
              color: isDarkMode ? Colors.white70 : Colors.black,
            ),
          ),
          Positioned(
            right: 80,
            top: 10,
            child: Image.asset(
              "images/star3.png",
              width: 20,
              color: isDarkMode ? Colors.white70 : Colors.black,
            ),
          ),
          Positioned(
            bottom: 80,
            right: 10,
            child: Image.asset(
              "images/Elements.png",
              width: 50,
              color: isDarkMode ? Colors.white70 : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class HalfOvalPainter extends CustomPainter {
  final bool isTop;
  final double rotationAngle;
  HalfOvalPainter({
    required this.isTop,
    this.rotationAngle = 0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = ui.Gradient.linear(
        const Offset(0, 0),
        Offset(size.width, size.height),
        const [
          Color(0xFF9D38F4), // Purple
          Color(0xFFFD7D7D), // Coral
          Color(0xFFFFA567), // Orange
        ],
        [0.0, 0.5, 1.0],
      );

    canvas.save();
    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(rotationAngle * 3.14159 / 180);
    canvas.translate(-size.width / 2, -size.height / 2);

    final path = Path();
    if (isTop) {
      path.moveTo(0, size.height);
      path.quadraticBezierTo(size.width / 2, 0, size.width, size.height);
    } else {
      path.moveTo(0, 0);
      path.quadraticBezierTo(size.width / 2, size.height, size.width, 0);
    }
    canvas.drawPath(path, paint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
