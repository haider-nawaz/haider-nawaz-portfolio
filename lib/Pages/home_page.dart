import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      "assets/firebase.webp", 
      width: 50,
      height: 50,
    ),
    Image.asset(
      "assets/flutter.webp",
      width: 40,
      height: 40,
    ),
    Image.asset("assets/flutterflow.webp", 
        width: 50,
        height: 50,
        fit: BoxFit.cover),
    Image.asset("assets/xcode.webp", 
        width: 60,
        height: 60,
        fit: BoxFit.cover),
    Image.asset(
      "assets/github.webp", 
      width: 35,
      height: 35,
    ),
    Image.asset("assets/cloud.webp", 
        width: 50,
        height: 50,
        fit: BoxFit.cover),
    Image.asset(
      "assets/android-studio.webp", 
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
      duration: const Duration(seconds: 8),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

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
                          // const BannerWidget(),
                          // headerWidget(),
                          const SizedBox(height: 50),
                          _landingWidget(context),

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
      )
        .animate() // Apply animation
        .fadeIn(
          duration: 1.seconds, curve: Curves.easeIn),
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
      ],
    );
  }

  Row navElements() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                launchUrl(
                  Uri.parse(
                    'https://haidernawaz8.gumroad.com/l/tiyffv',
                  ),
                  mode: LaunchMode.platformDefault,
                );
              },
              child: Text(
                "Kleanly",
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
                launchUrl(
                  Uri.parse(
                    'https://haidernawaz8.gumroad.com/l/kdrbn',
                  ),
                  mode: LaunchMode.platformDefault,
                );
              },
              child: Text(
                "Walls",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              )),
          const SizedBox(
            width: 25,
          ),
        ],
      );
  }

  GestureDetector socialsWidget() {
    return GestureDetector(
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
              "socials",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: kPrimaryColor,
              ),
            ),
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

    final TextStyle buildHeadingStyle = GoogleFonts.poppins(
      fontSize: 14, // Adjust font size for mobile
      fontWeight: FontWeight.normal,
      color: Colors.white54,
      height: 1.7,
      fontStyle: FontStyle.italic,
    );

    final TextStyle linkStyle = GoogleFonts.poppins(
      // fontSize: isMobile ? 14 : 16, // Adjust font size for mobile
      fontSize: 14, // Adjust font size for mobile
      fontWeight: FontWeight.normal,
      color: kPrimaryColor,
      height: 1.7,
      decoration: TextDecoration.none, // Initial underline for links
    );
    final TextStyle linkStyle2 = GoogleFonts.poppins(
      // fontSize: isMobile ? 14 : 16, // Adjust font size for mobile
      fontSize: 14, // Adjust font size for mobile
      fontWeight: FontWeight.normal,
      color: Colors.white,
      height: 1.7,
      decoration: TextDecoration.underline, // Initial underline for links
    );

    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: "Hi, I'm Haider",
              style: GoogleFonts.poppins(
                fontSize: 18, // Adjust font size for mobile
                fontWeight: FontWeight.w500,
                color: kPrimaryColor,
                height: 1.7,
              )),

          TextSpan(
              text:
                  "\n\nI build apps with Flutter, Flutterflow & SwiftUI.\n\nBuilt 14+ apps for mobile, web, and desktop platforms. You can find most projects on my ",
              style: defaultStyle),
          _linkTextSpan(
            "portfolio",
            "https://bejewled-ticket-894.notion.site/19b76c37c72c80bb94a8f408b6ef95ba?v=19b76c37c72c81c6be52000ce35e30e8",
            linkStyle,
          ), // Replace with your actual link
          TextSpan(
            text: "\n\nCurrently building",
            style: buildHeadingStyle,
          ),
          TextSpan(
            text: "\n - ",
            style: defaultStyle,
          ),
          _linkTextSpan(
            "Kleanly",
            "https://haidernawaz8.gumroad.com/l/tiyffv",
            linkStyle2,
          ), 
          TextSpan(
            text: "\n - ",
            style: defaultStyle,
          ),
          _linkTextSpan(
            "Salah",
            "https://haidernawaz8.gumroad.com/l/oeviz",
            linkStyle2,
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
            "mail",
            "mailto:haidernawaz737@gmail.com?subject=Interested%20in%20working%20with%20you",

            linkStyle,
          ), // Replace with your actual link
          TextSpan(
              text: " or just drop a quick\nmessage on ", style: defaultStyle),
          _linkTextSpan(
            "whatsapp",
            "https://wa.me/+923098605398",
            linkStyle,
          ),
           TextSpan(
              text: " with your requirements. ", style: defaultStyle),
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
      fontSize: 14, // Adjust font size for mobile
      fontWeight: FontWeight.normal,
      color: kPrimaryColor,
      height: 1.7,
      decoration: TextDecoration.none, // Underline for links
    );

    return RichText(
      text: TextSpan(
        style: defaultStyle,
        children: [
          const TextSpan(
            text: "Every now and then, I post about my projects and daily life on social media. You can\nfollow me on my ",
          ),
          TextSpan(
            text: "socials",
            style: linkStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
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
            constraints.maxWidth < 600;

        return SizedBox(
          width: constraints.maxWidth, 
          child: Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: isMobile
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
             
                flex: isMobile ? 0 : 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          isMobile ? 0 : 0), 
                  child: SizedBox(
                    width: isMobile
                        ? constraints.maxWidth
                        : constraints.maxWidth /
                            2, 

                    child: _introRichText(context),
                  ),
                ),
              ),
              if (isMobile)
                const SizedBox(height: 20), 
              LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 600;
                  const imageSize = 50.0; 
                  const radiusMultiplier = 1; 
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
                                      angle); 
                              return Positioned(
                                left: stackSize / 2 +
                                    x -
                                    imageSize / 2, 
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
    padding: const EdgeInsets.only(bottom: 4, top: 4),
    child: Center(
      child: Text(
        "Built with Flutter",
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: Colors.grey, 
        ),
      ),
    ),
  );
}
