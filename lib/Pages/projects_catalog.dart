import 'package:flutter/material.dart';
import 'package:haider_nawaz_portfolio_website/Pages/projects_screen.dart';

class ProjectsCatalog extends StatelessWidget {
  const ProjectsCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    //return a list view builder with the projects list

    return Padding(
      padding: const EdgeInsets.all(0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: ProjectsScreen.projects.length,
        itemBuilder: (BuildContext context, int index) {
          final project = ProjectsScreen.projects[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: ProjectCard(project: project),
          );
        },
      ),
    );
  }
}
