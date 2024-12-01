import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haider_nawaz_portfolio_website/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;

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
    return SingleChildScrollView(
      child: Column(
        children: [
          _footer(),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1000,
            ), // Set your desired max width

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                // mainAxisSize: MainAxisSize.min, // Crucial for this to work
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headerWidget(),
                  const SizedBox(
                    height: 60,
                  ),
                  // _aboutText(),
                  _landingWidget(context),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                  _workWithMeRichText(context),
                ],
              ),
            ),
          ),
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
                      'https://drive.google.com/file/d/1ssEZUqeaSDFuYodZzrcWRIl_GTtESdyA/view?usp=sharing',
                    ),
                    mode: LaunchMode.platformDefault,
                  );
                },
                child: Text(
                  "Get my CV",
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
                launchUrl(Uri.parse('https://github.com/haider-nawaz'),
                    mode: LaunchMode.platformDefault);
              },
              child: Text(
                "Github",
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
                  "\n\nI build apps with Flutter, Flutterflow & SwiftUI.\n\nBuilt over 10 apps for clients so far. Check out some of my indie projects on ",
              style: defaultStyle),
          _linkTextSpan(
            "Google Play",
            "https://play.google.com/store/apps/developer?id=Haider+Nawaz",
            linkStyle,
          ), // Replace with your actual link
          TextSpan(
            text:
                "\n\nBased in Pakistan, I've had the opportunity to work on both domestic and international projects. I also do hackathons from time to time. My app ",
            style: defaultStyle,
          ),
          _linkTextSpan(
              "Dr. Emma", "https://github.com/haider-nawaz/dr_emma", linkStyle),
          TextSpan(
              text:
                  " won the 1st place in a GPT hackathon.\n\nOn the side, I love to post on ",
              style: defaultStyle),
          _linkTextSpan("Instagram", "https://www.instagram.com/forthelaymen/",
              linkStyle),
          TextSpan(text: " and ", style: defaultStyle),
          _linkTextSpan(
            "Tiktok",
            "https://www.tiktok.com/@haider.developer",
            linkStyle,
          ),
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
              text: "Work With Me",
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
    padding: const EdgeInsets.only(top: 20),
    child: Column(
      children: [
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
        const SizedBox(height: 10),
        Divider(
          color: Colors.white.withOpacity(0.4),
          thickness: 0.5,
        ), // Add a divider above the footer
      ],
    ),
  );
}
