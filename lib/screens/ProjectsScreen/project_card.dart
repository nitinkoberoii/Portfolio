import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final String type;
  final String title;
  final List<String> link;
  final List<String> techStack;
  final String imagePath;

  const ProjectCard({
    super.key,
    required this.type,
    required this.title,
    required this.link,
    required this.techStack,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;

    return SizedBox(
      height: height * 0.28,
      width: width * 0.30,
      child: Card(
        surfaceTintColor: isDarkMode ? Colors.black : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 10,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(height * 0.01),
              child: SizedBox(
                width: width * 0.15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      type,
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
                      title,
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
                    Row(
                      children: techStack.take(4).map((imagePath) {
                        return Padding(
                          padding:
                              const EdgeInsets.only(right: 8.0), // Add spacing
                          child: Image.asset(
                            imagePath,
                            height: 20,
                            fit: BoxFit.contain,
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: height * 0.02),
                    Row(
                      children: [
                        if (link.isNotEmpty && link[0].contains("github"))
                          _projectLinkIcon(
                              isDarkMode, link[0], "svgs/github.svg", context),
                        if (link.length > 1 && link[1].contains("vercel"))
                          _projectLinkIcon(
                              isDarkMode, link[1], "svgs/vercel.svg", context),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              height: height * 0.28,
              width: width * 0.13,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
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

Widget _projectLinkIcon(
    bool isDarkMode, String linkUrl, String iconPath, BuildContext context) {
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
        iconPath,
        height: 20,
        color: isDarkMode ? Colors.white70 : Colors.black,
      ),
    ),
  );
}
