import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class DownloadResumeButton extends StatelessWidget {
  const DownloadResumeButton({super.key});

  final String resumeURl = Constants.resumeUrl;

  void _downloadResume() async {
    final Uri url = Uri.parse(resumeURl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw "Could not launch $resumeURl";
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.only(top: height * 0.01, right: width * 0.01),
      child: ElevatedButton.icon(
        icon: Icon(
          Icons.download,
          size: 20,
          color: isDarkMode ? Colors.black : Colors.white,
        ),
        onPressed: _downloadResume,
        label: Text(
          "Download Resume",
          style: TextStyle(
            color: isDarkMode ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
