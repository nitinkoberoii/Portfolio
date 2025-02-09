import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/screens/HomeScreen/gradient_image_overlay.dart';
import 'package:portfolio/widgets/download_resume_button.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;

    return Column(
      children: [
        // ----------------- Download Resume button ------------------------
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [DownloadResumeButton()],
        ),
        // ---------------------- content ----------------------------------
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: height * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  children: [
                    Positioned(
                      right: 240,
                      top: -30,
                      child: CustomPaint(
                        size: const Size(270, 260),
                        painter: ShapePainter(),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // ------------------ name ----------------------------------
                        SizedBox(
                          height: height * 0.80,
                          width: width * 0.306,
                          child: Column(
                            children: [
                              SizedBox(height: height * 0.08),
                              RichText(
                                text: TextSpan(
                                  text: "MY NAME\nIS",
                                  style:
                                      theme.textTheme.headlineLarge?.copyWith(
                                    fontFamily: "Poppins",
                                    fontSize: 60,
                                    fontWeight: FontWeight.w500,
                                    height: 1,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: " NITIN\nKUMAR\nOBEROI...",
                                      style: theme.textTheme.headlineLarge
                                          ?.copyWith(
                                        fontSize: 70,
                                        fontWeight: FontWeight.w900,
                                        height: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // --------------- job/work ---------------------------
                              SizedBox(height: height * 0.03),
                              RichText(
                                text: TextSpan(
                                  text: "Software Engineer\n",
                                  style:
                                      theme.textTheme.headlineMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 30,
                                    height: 1,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "based in India",
                                      style: theme.textTheme.headlineSmall
                                          ?.copyWith(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: height * 0.05),
                              // --------------- contact button ---------------------
                              SizedBox(
                                height: height * 0.050,
                                width: width * 0.15,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Let's talk with me ",
                                        style:
                                            theme.textTheme.bodySmall?.copyWith(
                                          fontSize: 16,
                                          color: isDarkMode
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.rectangle,
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
                                        child:
                                            SvgPicture.asset("svgs/arrow.svg"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Spacer(),
                              // ----------- phone number and email ---------------
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        child: CircleAvatar(
                                          radius: 12,
                                          backgroundColor: theme.dividerColor,
                                          child: SvgPicture.asset(
                                            "svgs/call.svg",
                                            height: 16,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: width * 0.005),
                                      Text(
                                        Constants.phoneNumber,
                                        style:
                                            theme.textTheme.bodySmall?.copyWith(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: height * 0.01),
                                  Row(
                                    children: [
                                      SizedBox(
                                        child: CircleAvatar(
                                          radius: 12,
                                          backgroundColor: theme.dividerColor,
                                          child: SvgPicture.asset(
                                            "svgs/gmail.svg",
                                            height: 16,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: width * 0.005),
                                      Text(
                                        Constants.email,
                                        style:
                                            theme.textTheme.bodySmall?.copyWith(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // ---------------------- image ----------------------------
                Column(
                  children: [
                    SizedBox(
                      height: height * 0.80,
                      width: width * 0.30,
                      child: const GradientImageOverlay(),
                    ),
                  ],
                ),
                // ------------------ small space for icons ---------------------
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Column(
                          children: [
                            _socialIcons("svgs/instagram.svg", isDarkMode,
                                Constants.instagramUrl),
                            SizedBox(height: height * 0.01),
                            _socialIcons("svgs/linkedin.svg", isDarkMode,
                                Constants.linkedInUrl),
                            SizedBox(height: height * 0.01),
                            _socialIcons("svgs/github.svg", isDarkMode,
                                Constants.githubUrl),
                            SizedBox(height: height * 0.01),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: height * 0.18,
                              child: VerticalDivider(
                                color: isDarkMode ? Colors.grey : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

void _openLink(String? linkUrl) async {
  final Uri url = Uri.parse(linkUrl!);
  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    throw "Could not launch $linkUrl";
  }
}

Widget _socialIcons(String assetPath, bool isDarkMode, String linkUrl) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: isDarkMode ? Colors.white70 : Colors.black,
      ),
      shape: BoxShape.circle,
    ),
    child: IconButton(
      onPressed: () => _openLink(linkUrl),
      icon: SvgPicture.asset(
        assetPath,
        height: 18,
        color: isDarkMode ? Colors.white70 : Colors.black,
      ),
    ),
  );
}

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color(0xFF9D38F4), // Purple
          Color(0xFFFD7D7D), // Coral
          Color(0xFFFFA567), // Orange
        ],
        stops: [0.0, 0.5, 1.0],
        transform: GradientRotation(-100 * 3.14159 / 180),
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.save();

    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(60 * 3.14159 / 180);
    canvas.translate(-size.width / 2, -size.height / 2);

    final path = Path()
      ..moveTo(size.width * 0.6, size.height * 0.2)
      ..quadraticBezierTo(
        size.width * 0.9,
        size.height * 0.5,
        size.width * 0.6,
        size.height * 0.8,
      );

    canvas.drawPath(path, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
