import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BannerPage extends StatelessWidget {
  const BannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('announcements')
          .doc('latest')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const SizedBox(); // No announcement, so return empty widget
        }

        var data = snapshot.data!;
        bool isVisible =
            data['isVisible'] ?? false; // Firestore visibility check
        if (!isVisible) return const SizedBox(); // Hide if isVisible is false

        String message = data['message'] ?? '';
        String bgColor = data['backgroundColor'] ?? '#000000';

        return Center(
          child: IntrinsicWidth(
            child: Container(
              constraints: BoxConstraints(
                maxWidth:
                    MediaQuery.of(context).size.width * 0.9, // Limit max width
              ),
              margin: const EdgeInsets.only(top: 10, bottom: 20),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                color: Color(int.parse(bgColor.replaceAll('#', '0xFF'))),
              ),
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            )
                .animate() // Apply animation
                .fadeIn(duration: 1.seconds, curve: Curves.easeIn),
          ),
        );
      },
    );
  }
}
