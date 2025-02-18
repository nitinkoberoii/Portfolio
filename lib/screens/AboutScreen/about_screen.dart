import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/screens/AboutScreen/app_texts.dart';
import 'package:portfolio/screens/AboutScreen/profile_image_gradient_screen.dart';
import 'package:portfolio/widgets/contact_rows.dart';
import 'package:portfolio/widgets/download_resume_button.dart';
import '../../constants.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final Color quoteContainerColor =
        theme.elevatedButtonTheme.style?.backgroundColor?.resolve({}) ??
            Colors.blue;
    final bool isDarkMode = theme.brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.05,
      ),
      child: Column(
        children: [
          // ----------------- contains welcome text ------------------
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nice to meet you!",
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    "WELCOME TO...",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontFamily: "Poppins",
                      fontSize: 34,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const DownloadResumeButton(),
            ],
          ),
          SizedBox(height: height * 0.01),
          // ------------------ picture and other contents ---------------------
          Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: height * 0.75,
                    width: width * 0.28,
                    child: const ProfileImageGradientScreen(),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  SizedBox(
                    height: height * 0.75,
                    width: width * 0.35,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const ContactRows(
                              assetPath: "svgs/call.svg",
                              text: Constants.phoneNumber,
                            ),
                            SizedBox(width: width * 0.08),
                            const ContactRows(
                              assetPath: "svgs/User.svg",
                              text: Constants.age,
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.02),
                        Row(
                          children: [
                            const ContactRows(
                              assetPath: "svgs/gmail.svg",
                              text: Constants.email,
                            ),
                            SizedBox(width: width * 0.0345),
                            const ContactRows(
                              assetPath: "svgs/location.svg",
                              text: Constants.location,
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.03),
                        const Divider(),
                        SizedBox(height: height * 0.03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // -------------- experience section ---------------
                            SizedBox(
                              width: width * 0.165,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "svgs/scroll.svg",
                                        height: 36,
                                        color: isDarkMode
                                            ? Colors.white70
                                            : Colors.black,
                                      ),
                                      SizedBox(width: width * 0.01),
                                      Text(
                                        "My\nExperience...",
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                          fontStyle: FontStyle.italic,
                                          height: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: height * 0.02),
                                  Text(
                                    AppTexts.myExperience,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      fontSize: 14,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // -------------- collaborate section --------------
                            SizedBox(
                              width: width * 0.165,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "svgs/collab.svg",
                                        height: 38,
                                        color: isDarkMode
                                            ? Colors.white70
                                            : Colors.black,
                                      ),
                                      SizedBox(width: width * 0.01),
                                      Text(
                                        "Let's\nCollaborate...",
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                          fontStyle: FontStyle.italic,
                                          height: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: height * 0.02),
                                  Text(
                                    AppTexts.letsCollaborate,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      fontSize: 14,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.05),
                        Container(
                          width: width * 0.35,
                          height: height * 0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: quoteContainerColor,
                          ),
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.01),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "svgs/quotes1.svg",
                                  height: 100,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "'The only way to do great work is to love what you do.'",
                                      style:
                                          theme.textTheme.bodySmall?.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w100,
                                        color: Colors.white,
                                        fontStyle: FontStyle.italic,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "- Steve Jobs",
                                      style:
                                          theme.textTheme.bodySmall?.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w100,
                                        color: Colors.white,
                                        fontStyle: FontStyle.italic,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
