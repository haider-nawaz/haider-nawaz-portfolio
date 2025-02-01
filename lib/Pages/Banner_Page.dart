import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BannerPage extends StatelessWidget {
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
        if (!isVisible) return SizedBox(); // Hide if isVisible is false

        String message = data['message'] ?? '';
        String bgColor = data['backgroundColor'] ?? '#000000';

        return Center(
          child: IntrinsicWidth(
            child: Container(
              constraints: BoxConstraints(
                maxWidth:
                    MediaQuery.of(context).size.width * 0.9, // Limit max width
              ),
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                gradient: LinearGradient(
                  colors: [
                    Color(int.parse(bgColor.replaceFirst("#", "0xff"))),
                    Colors.black87
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
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
