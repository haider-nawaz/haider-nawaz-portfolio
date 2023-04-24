import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final double widthFactor;
  final double heightFactor;

  const SkillCard({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.widthFactor,
    required this.heightFactor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Get.width > 890;

    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      width: !isDesktop
          ? widthFactor == 1
              ? 200
              : 125
          : widthFactor == 1
              ? 320
              : 200,
      height: isDesktop ? 200 : 140,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: isDesktop ? 30 : 16,
                  color: Colors.white,
                ),
                SizedBox(width: isDesktop ? 10 : 4),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: isDesktop ? 22 : 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            if (isDesktop) const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description,
                softWrap: true,
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                  fontSize: !isDesktop ? 14 : 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
