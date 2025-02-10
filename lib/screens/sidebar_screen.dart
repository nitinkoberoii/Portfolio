import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/providers/theme_provider.dart';
import 'package:portfolio/screens/AboutScreen/about_screen.dart';
import 'package:portfolio/screens/HomeScreen/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../widgets/theme_button.dart';

class SidebarScreen extends StatelessWidget {
  const SidebarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Row(
        children: [
          Container(
            width: width * 0.22,
            color: Colors.black,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.05,
                vertical: height * 0.05,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "images/N_logo.png",
                    height: height * 0.07,
                  ),
                  SizedBox(height: height * 0.09),
                  _sidebarNavTexts("Home"),
                  SizedBox(height: height * 0.03),
                  _sidebarNavTexts("About"),
                  SizedBox(height: height * 0.03),
                  _sidebarNavTexts("Skills"),
                  SizedBox(height: height * 0.03),
                  _sidebarNavTexts("Projects"),
                  SizedBox(height: height * 0.03),
                  _sidebarNavTexts("Blogs"),
                  SizedBox(height: height * 0.03),
                  _sidebarNavTexts("Contact"),
                  SizedBox(height: height * 0.09),
                  Row(
                    children: [
                      _appIcons("LinkedIn", "svgs/linkedin.svg", 26,
                          Constants.linkedInUrl),
                      SizedBox(width: width * 0.0125),
                      _appIcons(
                          "GitHub", "svgs/github.svg", 26, Constants.githubUrl),
                      SizedBox(width: width * 0.0125),
                      _appIcons("Discord", "svgs/discord.svg", 26,
                          Constants.discordUrl),
                    ],
                  ),
                  SizedBox(height: height * 0.03),
                  Row(
                    children: [
                      _appIcons("Instagram", "svgs/instagram.svg", 20,
                          Constants.instagramUrl),
                      SizedBox(width: width * 0.0125),
                      _appIcons("Twitter", "svgs/twitter.svg", 20,
                          Constants.twitterUrl),
                      SizedBox(width: width * 0.0125),
                      const ThemeButton(),
                      // CircleAvatar(
                      //   backgroundColor: Colors.white,
                      //   child: SvgPicture.asset(
                      //     "svgs/notion.svg",
                      //     height: 20,
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(height: height * 0.075),
                  Row(
                    children: [
                      const Text(
                        "Build using ",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Ubuntu",
                          fontSize: 13,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SvgPicture.asset(
                        "svgs/flutter.svg",
                        height: 18,
                      ),
                      const Text(
                        "with much ",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontFamily: "Ubuntu",
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SvgPicture.asset(
                        "svgs/heart.svg",
                        height: 18,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                right: width * 0.010,
                top: height * 0.019,
                bottom: height * 0.019,
              ),
              child: Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
                  final containerColor = Theme.of(context)
                          .extension<CustomColors>()
                          ?.containerColor ??
                      Colors.white;

                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: containerColor,
                    ),
                    child: const AboutScreen(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _sidebarNavTexts(String text) {
  return Text(
    text,
    textAlign: TextAlign.start,
    style: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
      color: Colors.white,
    ),
  );
}

void _openLink(String? linkUrl) async {
  final Uri url = Uri.parse(linkUrl!);
  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    throw "Could not launch $linkUrl";
  }
}

Widget _appIcons(
    String message, String assetPath, double height, String? linkUrl) {
  return Tooltip(
    message: message,
    waitDuration: const Duration(milliseconds: 1000),
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () => _openLink(linkUrl),
        icon: SvgPicture.asset(
          assetPath,
          height: height,
        ),
      ),
    ),
  );
}
