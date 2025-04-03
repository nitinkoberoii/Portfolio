import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/screens/ProjectsScreen/project_card_expanded.dart';
import 'package:portfolio/screens/ProjectsScreen/projects_list.dart';

import '../../widgets/download_resume_button.dart';

class AllProjectsScreen extends StatelessWidget {
  const AllProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final projects = ProjectsList.projects.toList();

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
              IconButton(
                onPressed: () => GoRouter.of(context).pop(),
                icon: const Icon(CupertinoIcons.back),
              ),
              const Spacer(),
              const DownloadResumeButton(),
            ],
          ),
          SizedBox(height: height * 0.05),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.03,
              ),
              child: ListView.builder(
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  final project = projects[index];
                  return ProjectCardExpanded(
                    type: project['type'],
                    title: project['title'],
                    link: project['link'],
                    techStack: List<String>.from(project['techStack']),
                    imagePath: project['imagePath'],
                    readme: project['readme'],
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
