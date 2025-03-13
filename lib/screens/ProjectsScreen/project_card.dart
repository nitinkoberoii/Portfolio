import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;

    return SizedBox(
      height: height * 0.25,
      width: width * 0.25,
      child: Card(
        surfaceTintColor: isDarkMode ? Colors.black : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 10,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(height * 0.01),
              child: SizedBox(
                width: width * 0.10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Personal",
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontStyle: FontStyle.italic,
                        height: 1,
                      ),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textScaler: const TextScaler.linear(1.0),
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      "Nitin's Portfolio",
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontFamily: "Poppins",
                        fontSize: 34,
                        height: 1,
                      ),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textScaler: const TextScaler.linear(1.0),
                    ),
                    const Spacer(),
                    _projectLinkIcon(
                      isDarkMode,
                      "https://github.com/nitinkoberoii/Portfolio",
                      context,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              height: height * 0.25,
              width: width * 0.12,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  "images/photo.jpeg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
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

Widget _projectLinkIcon(bool isDarkMode, String linkUrl, BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;

  return Container(
    height: height * 0.05,
    decoration: BoxDecoration(
      border: Border.all(
        color: isDarkMode ? Colors.white70 : Colors.black,
      ),
      shape: BoxShape.circle,
    ),
    child: IconButton(
      onPressed: () => _openLink(linkUrl),
      icon: SvgPicture.asset(
        "svgs/github.svg",
        height: 20,
        color: isDarkMode ? Colors.white70 : Colors.black,
      ),
    ),
  );
}
