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
    return Container(
      // width: MediaQuery.of(context).size.width > 890 ? 300 : 300,
      //height: MediaQuery.of(context).size.width > 890 ? 400 : 260,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
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
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              project.imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              project.title,
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              project.description,
              style: GoogleFonts.poppins(),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectsScreen extends StatelessWidget {
  final List<Project> projects = [
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

    return Container(
      width: screenSize.width,
      height: screenSize.height,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Featured Projects",
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),
          Flexible(
            child: SizedBox(
              //height: 400,
              //color: Colors.red,
              width: screenSize.width > 890
                  ? screenSize.width * 0.9
                  : screenSize.width,
              child: Center(
                child: GridView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  itemCount: projects.length,
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
            ),
          ),
          //a text button to navigate to the projects page
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: TextButton(
              onPressed: () {
                Get.find<MainScrollController>().scrollTo(1);
              },
              style: TextButton.styleFrom(
                iconColor: kPrimaryColor,
                backgroundColor: kPrimaryColor.withOpacity(0.1),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                textStyle: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              child: Text(
                "Let's get acquainted",
                style: GoogleFonts.poppins(
                  color: kPrimaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
