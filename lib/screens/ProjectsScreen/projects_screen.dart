import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/screens/ProjectsScreen/project_card.dart';
import 'package:portfolio/screens/ProjectsScreen/projects_list.dart';

import '../../widgets/download_resume_button.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;

    final projects = ProjectsList.projects.take(4).toList();

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
                    "Work",
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    "Recent Projects",
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
          SizedBox(
            height: height * 0.60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int i = 0; i < 2; i++)
                      ProjectCard(
                        type: projects[i]['type'],
                        title: projects[i]['title'],
                        link: projects[i]['link'],
                        techStack: List<String>.from(projects[i]['techStack']),
                        imagePath: projects[i]['imagePath'],
                      ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int i = 2; i < 4; i++)
                      ProjectCard(
                        type: projects[i]['type'],
                        title: projects[i]['title'],
                        link: projects[i]['link'],
                        techStack: List<String>.from(projects[i]['techStack']),
                        imagePath: projects[i]['imagePath'],
                      ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.05),
          SizedBox(
            height: height * 0.050,
            width: width * 0.11,
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "View More ",
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: 16,
                      color: isDarkMode ? Colors.black : Colors.white,
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
                    child: SvgPicture.asset("svgs/arrow.svg"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
