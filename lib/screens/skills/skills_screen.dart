import 'package:flutter/material.dart';
import 'package:portfolio/screens/skills/skills_list.dart';

import '../../widgets/download_resume_button.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.05,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Skills",
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    "MY TECH STACK",
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
          SizedBox(height: height * 0.03),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.015),
            child: Column(
              children: [
                _skillRow(theme, height, width, "Programming Languages",
                    SkillsList.programmingLanguages),
                SizedBox(height: height * 0.02),
                _skillRow(theme, height, width, "Frontend Development",
                    SkillsList.frontEndDevelopment),
                SizedBox(height: height * 0.02),
                _skillRow(theme, height, width, "Backend Development",
                    SkillsList.backEndDevelopment),
                SizedBox(height: height * 0.02),
                _skillRow(theme, height, width, "Database Management",
                    SkillsList.databaseManagement),
                SizedBox(height: height * 0.02),
                _skillRow(theme, height, width, "Tools & Version Control",
                    SkillsList.versionControl),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _skillRow(ThemeData theme, double height, double width, String category,
    Map<String, String> image) {
  return Column(
    children: [
      Row(
        children: [
          const Text("•"),
          SizedBox(width: width * 0.01),
          Text(
            category,
            style: theme.textTheme.bodyMedium,
          ),
          const Spacer(),
          Row(
            children: image.entries.map((entry) {
              return Padding(
                padding: EdgeInsets.only(left: width * 0.01),
                child: Tooltip(
                  message: entry.key,
                  child: Image.asset(
                    entry.value,
                    height: height * 0.07,
                    fit: BoxFit.contain,
                  ),
                ),
              );
            }).toList(), // Convert Iterable to List
          ),
        ],
      ),
      SizedBox(height: height * 0.02),
      const Divider(),
    ],
  );
}
