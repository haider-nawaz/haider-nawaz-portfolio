import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haider_nawaz_portfolio_website/Controllers/main_scroll_controller.dart';

import '../constants.dart';

class Project {
  final String title;
  final String description;
  final String imageUrl;

  const Project(
      {required this.title, required this.description, required this.imageUrl});
}

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    bool isMobile = Get.width <= 500;

    return Container(
      // width: MediaQuery.of(context).size.width > 890 ? 300 : 300,
      //height: MediaQuery.of(context).size.width > 890 ? 400 : 260,
      height: isMobile ? 490 : 450,
      //width: 350,
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xff333333),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              project.imageUrl,
              width: double.infinity,
              height: 350,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 13),
          Padding(
            padding: !isMobile
                ? const EdgeInsets.only(left: 17)
                : const EdgeInsets.only(left: 7, right: 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: GoogleFonts.quicksand(
                      color: Colors.white,
                      fontSize: isMobile ? 21 : 22,
                      fontWeight: FontWeight.bold),
                ),
                isMobile
                    ? const SizedBox(height: 7)
                    : const SizedBox(height: 10),
                Text(
                  project.description,
                  style: GoogleFonts.quicksand(
                    fontSize: isMobile ? 15 : 18,
                    color: Colors.white.withOpacity(0.8),
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectsScreen extends StatelessWidget {
  static final List<Project> projects = [
    const Project(
      title: 'ANA - Ecommerce Website',
      description:
          "An ecommerce website with admin and customer interfaces. Responsive and beutiful design with core features.",
      imageUrl: 'assets/ana.png',
    ),
    const Project(
      title: 'Ibuy - Retailer (Web & Mobile)',
      description:
          'A retail managment and discount hub platform. Andriod and iOS mobile apps with the 2 admin interfaces on web.',
      imageUrl: 'assets/ibuy.png',
    ),
    const Project(
      title: 'Personal Expense Tracker  App',
      description:
          'A peronal expense tracker application with beautiful UI and core features. Firebase backend and Flutter frontend.',
      imageUrl: 'assets/tracker.png',
    ),
  ];

  ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      // height: 400,

      //color: Colors.red,
      //width: 400,
      child: Center(
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemCount: 1,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: screenSize.width < 600 ? 1 : 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (BuildContext context, int index) {
            final project = projects[index];
            return ProjectCard(project: project);
          },
        ),
      ),
    );
  }
}
