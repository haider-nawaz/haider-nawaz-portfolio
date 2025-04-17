import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haider_nawaz_portfolio_website/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff222122),
      body: Center(
        child: ConstrainedBox(
          
          constraints: const BoxConstraints(
            maxWidth: 470,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                spacing: 24,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                
                  
                children: [
                  const SizedBox(height: 50,),
                  _introRichText(context),
                  _currentWork(context),
                  const Divider(),
                  _workWithMeRichText(context),
                  const SizedBox(height: 50),
                ],
              )
                .animate() // Apply animation
                .fadeIn(
                  duration: 1.seconds, curve: Curves.easeIn),
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector socialsWidget(BuildContext context) {
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
              ),),

          TextSpan(
              text:
                  "\n\nI build apps with Flutter, Flutterflow & SwiftUI \n\nTop-Rated on Upwork with 14+ apps across mobile, web, and desktop. ",
              style: defaultStyle,),

               TextSpan(
            text: "Here's the full list of my ",
            style: defaultStyle,
          ),
          _linkTextSpan(
            "apps",
            "https://bejewled-ticket-894.notion.site/19b76c37c72c80bb94a8f408b6ef95ba?v=19b76c37c72c81c6be52000ce35e30e8",
            linkStyle,
          ), // Replace with your actual link
          TextSpan(
            text: "\n\nI'm 24, from Lahore, Pakistan. I've always had a thing for well-made apps, so I started with Flutter in 2021 and have been enjoying building high-quality apps ever since. ",
            style: defaultStyle,
          ),
          TextSpan(
            text: "\n\n I also make indie apps on the side. ",
            style: defaultStyle,
          ),
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
            "mail",
            "mailto:haidernawaz737@gmail.com?subject=Interested%20in%20working%20with%20you",

            linkStyle,
          ), // Replace with your actual link
          TextSpan(
              text: " or just drop a quick message on ", style: defaultStyle),
          _linkTextSpan(
            "whatsapp",
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
            text: "I post about my projects (specially Indie porjects) and daily life on social media. You can follow me ",
          ),
          TextSpan(
            text: "here",
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
    }