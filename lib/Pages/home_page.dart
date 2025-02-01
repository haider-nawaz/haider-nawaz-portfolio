import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haider_nawaz_portfolio_website/Pages/banner_page.dart';
import 'package:haider_nawaz_portfolio_website/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;
import 'package:flutter_animate/flutter_animate.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Widget> _revolvingImages = [
    Image.asset(
      "assets/firebase.webp", // Replace with small image asset
      width: 50,
      height: 50,
    ),
    Image.asset(
      "assets/flutter.webp", // Replace with small image asset
      width: 40,
      height: 40,
    ),
    Image.asset("assets/flutterflow.webp", // Replace with small image asset
        width: 50,
        height: 50,
        fit: BoxFit.cover),
    Image.asset("assets/xcode.webp", // Replace with small image asset
        width: 60,
        height: 60,
        fit: BoxFit.cover),
    Image.asset(
      "assets/github.webp", // Replace with small image asset
      width: 35,
      height: 35,
    ),
    Image.asset("assets/cloud.webp", // Replace with small image asset
        width: 50,
        height: 50,
        fit: BoxFit.cover),
    Image.asset(
      "assets/android-studio.webp", // Replace with small image asset
      width: 50,
      height: 50,
      fit: BoxFit.cover,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10), // Adjust rotation speed
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff222122),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 1000,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const BannerPage(),
                          headerWidget(),
                          const SizedBox(height: 60),
                          _landingWidget(context)
                              .animate() // Apply animation
                              .fadeIn(
                                  duration: 1.seconds, curve: Curves.easeIn),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 30),
                            child: Divider(color: Colors.white),
                          ),
                          _currentWork(context),
                          _workWithMeRichText(context),
                          const SizedBox(height: 50), // Add some bottom padding
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          _footer(), // Footer will now stay at the bottom
        ],
      ),
    );
  }

  Row headerWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              "Haider Nawaz",
              style: titleStyle(kPrimaryColor, true),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //a tonal button
            // FilledButton(
            //     onPressed: () {}, child: Text("Get my CV")),

            InkWell(
                onTap: () {
                  launchUrl(
                    Uri.parse(
                      'https://discord.gg/FnF2aysq',
                    ),
                    mode: LaunchMode.platformDefault,
                  );
                },
                child: Text(
                  "Discord",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                )),
            const SizedBox(
              width: 25,
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: const Color(0xff222122),
                      title: Column(
                        children: [
                          Text(
                            "Socials",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            "I post about my work and daily life here :)",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _socialButton(
                              "Github", "https://github.com/haider-nawaz"),
                          _socialButton("LinkedIn",
                              "https://www.linkedin.com/in/haider-nawaz-565584196/"),
                          _socialButton("Instagram",
                              "https://www.instagram.com/forthelaymen/"),
                          _socialButton("Threads",
                              "https://www.threads.net/@forthelaymen"),
                          _socialButton("Tiktok",
                              "https://www.tiktok.com/@haider.developer"),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Text(
                "Socials",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _socialButton(String title, String url) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () async {
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          } else {
            debugPrint("Could not launch $url");
          }
        },
        child: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: kPrimaryColor, // Make sure kPrimaryColor is defined
          ),
        ),
      ),
    );
  }

  TextStyle titleStyle(Color color, bool isBold) => GoogleFonts.enriqueta(
        fontSize: isBold ? 20 : 16,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        color: color,
      );

  Widget _introRichText(BuildContext context) {
    final TextStyle defaultStyle = GoogleFonts.poppins(
      fontSize: 14, // Adjust font size for mobile
      fontWeight: FontWeight.normal,
      color: Colors.white,
      height: 1.7,
    );

    final TextStyle linkStyle = GoogleFonts.poppins(
      // fontSize: isMobile ? 14 : 16, // Adjust font size for mobile
      fontSize: 14, // Adjust font size for mobile
      fontWeight: FontWeight.normal,
      color: kPrimaryColor,
      height: 1.7,
      decoration: TextDecoration.none, // Initial underline for links
    );

    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: "Hi, I'm Haider",
              style: GoogleFonts.poppins(
                fontSize: 16, // Adjust font size for mobile
                fontWeight: FontWeight.w500,
                color: Colors.white,
                height: 1.7,
              )),

          TextSpan(
              text:
                  "\n\nI build apps with Flutter, Flutterflow & SwiftUI.\n\nBuilt 10+ apps across mobile, web, and desktop platforms. I do indie development on the side, check some of my projects on ",
              style: defaultStyle),
          _linkTextSpan(
            "Google Play",
            "https://play.google.com/store/apps/developer?id=Haider+Nawaz",
            linkStyle,
          ), // Replace with your actual link
          TextSpan(
            text: "\n\nI also do hackathons from time to time. My app ",
            style: defaultStyle,
          ),
          _linkTextSpan(
              "Dr. Emma", "https://github.com/haider-nawaz/dr_emma", linkStyle),
          TextSpan(
              text: " won the 1st place in a GPT hackathon.",
              style: defaultStyle),
          // _linkTextSpan("Instagram", "https://www.instagram.com/forthelaymen/",
          //     linkStyle),
          // TextSpan(text: " and ", style: defaultStyle),
          // _linkTextSpan(
          //   "Threads",
          //   "https://www.threads.net/@forthelaymen",
          //   linkStyle,
          // ),
        ],
      ),
    );
  }

  Widget _workWithMeRichText(BuildContext context) {
    final TextStyle defaultStyle = GoogleFonts.poppins(
      fontSize: 14, // Adjust font size for mobile
      fontWeight: FontWeight.normal,
      color: Colors.white,
      height: 1.7,
    );

    final TextStyle linkStyle = GoogleFonts.poppins(
      // fontSize: isMobile ? 14 : 16, // Adjust font size for mobile
      fontSize: 14, // Adjust font size for mobile
      fontWeight: FontWeight.normal,
      color: kPrimaryColor,
      height: 1.7,
      decoration: TextDecoration.none, // Initial underline for links
    );

    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: "\nWork With Me",
              style: GoogleFonts.poppins(
                fontSize: 16, // Adjust font size for mobile
                fontWeight: FontWeight.w500,
                color: Colors.white,
                height: 1.7,
              )),
          TextSpan(
              text:
                  "\n\nI do take on client projects. You can reach out to me on ",
              style: defaultStyle),
          _linkTextSpan(
            "Email",
            "mailto:haidernawaz737@gmail.com?subject=Interested%20in%20working%20with%20you", // Encode special characters in the body

            linkStyle,
          ), // Replace with your actual link
          TextSpan(
              text: " or just drop a quick message on ", style: defaultStyle),
          _linkTextSpan(
            "Whatsapp",
            "https://wa.me/+923098605398",
            linkStyle,
          ),
        ],
      ),
    );
  }

  Widget _currentWork(BuildContext context) {
    final TextStyle defaultStyle = GoogleFonts.poppins(
      fontSize: 14, // Adjust font size for mobile
      fontWeight: FontWeight.normal,
      color: Colors.white,
      height: 1.7,
    );

    final TextStyle linkStyle = GoogleFonts.poppins(
      // fontSize: isMobile ? 14 : 16, // Adjust font size for mobile
      fontSize: 14, // Adjust font size for mobile
      fontWeight: FontWeight.normal,
      color: kPrimaryColor,
      height: 1.7,
      decoration: TextDecoration.none, // Initial underline for links
    );

    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: "I've recently launched some macOS apps, try them out here",
              style: defaultStyle),
          _linkTextSpan(
            "\n\n• Salah",
            "https://haidernawaz8.gumroad.com/l/oeviz", // Encode special characters in the body

            linkStyle,
          ), // Replace with your actual link
          TextSpan(
              text: " - Muslim prayer times right in your menubar.",
              style: defaultStyle),
          // TextSpan(text: " and ", style: defaultStyle),
          _linkTextSpan(
            "\n• Kleanly",
            "https://haidernawaz8.gumroad.com/l/tiyffv",
            linkStyle,
          ),
          TextSpan(
              text:
                  " - Disable your keyboard & trackpad while cleaning so it doesn't mess up your work",
              style: defaultStyle),
        ],
      ),
    );
  }

  TextSpan _linkTextSpan(String text, String url, TextStyle style) {
    return TextSpan(
      text: text,
      style: style,
      recognizer: TapGestureRecognizer()
        ..onTap = () async {
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          } else {
            // Handle error if the URL can't be launched
            debugPrint("Could not launch $url");
          }
        },
      mouseCursor: SystemMouseCursors.click, // Show click cursor on hover
    );
  }

  Widget _landingWidget(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile =
            constraints.maxWidth < 600; // Adjust breakpoint as needed

        return SizedBox(
          width: constraints.maxWidth, // Occupy available width
          child: Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: isMobile
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                // Use Flexible for better space distribution
                flex: isMobile ? 0 : 1, // Adjust flex values as needed
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          isMobile ? 0 : 0), // Add padding for better spacing
                  child: SizedBox(
                    width: isMobile
                        ? constraints.maxWidth
                        : constraints.maxWidth /
                            2, // Example: half the available width on larger screens

                    child: _introRichText(context),
                  ),
                ),
              ),
              if (isMobile)
                const SizedBox(height: 20), // Space only in desktop view
              LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 600;
                  const imageSize = 50.0; // Size of your revolving images
                  const radiusMultiplier = 1; // Your current radius multiplier
                  final avatarSize = isMobile ? 150.0 : 180.0;
                  final stackSize = avatarSize + imageSize * radiusMultiplier;

                  return SizedBox(
                    width: stackSize,
                    height: stackSize,
                    child: Stack(
                      fit: StackFit.expand,
                      alignment: Alignment.center,
                      children: [
                        ...List.generate(_revolvingImages.length, (index) {
                          return AnimatedBuilder(
                            animation: _controller,
                            builder: (context, child) {
                              final angle = 2 *
                                      math.pi *
                                      index /
                                      _revolvingImages.length +
                                  _controller.value * 2 * math.pi;
                              final x = avatarSize / 2 * 1 * math.cos(angle);
                              final y = avatarSize /
                                  2 *
                                  1 *
                                  math.sin(
                                      angle); //Correcting this as pointed out in chat. Sorry about that
                              return Positioned(
                                left: stackSize / 2 +
                                    x -
                                    imageSize / 2, // Offset for image size
                                top: stackSize / 2 + y - imageSize / 2,
                                child: child!,
                              );
                            },
                            child: _revolvingImages[index],
                          );
                        }),
                        Image.asset(
                          "assets/avatar.webp",
                          width: avatarSize,
                          height: avatarSize,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  );
                },

// ... rest of your code
              )
            ],
          ),
        );
      },
    );
  }
}

Widget _footer() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Column(
      children: [
        Divider(
          color: Colors.white.withOpacity(0.4),
          thickness: 0.5,
        ),
        const SizedBox(height: 5),
        Center(
          // Center the footer content

          child: Text(
            "2025   •   Haider Nawaz   •   Built in Flutter",
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.white.withOpacity(0.4), // Slightly muted text
            ),
          ),
        ),
      ],
    ),
  );
}
