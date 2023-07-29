import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gif/gif.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haider_nawaz_portfolio_website/Pages/projects_catalog.dart';
import 'package:haider_nawaz_portfolio_website/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Controllers/main_scroll_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> underLineList = [false, false, false];
  final String aboutText = """

Formerly, I worked at AppCrates as a team lead and developed an e-commerce app entirely in flutter. I've been freelancing for the past year and have developed full stack applications for businesses. I'll be graduating with a Computer Science degree this year. I'm also a tech blogger and have written some articles on medium.
""";
  final String introLine = """
I'm a freelance flutter developer, a tech enthusiast and a content creator. For the past 2 years I've been working with flutter and have made some amazing apps.
""";

  @override
  Widget build(BuildContext context) {
    bool isMobile = Get.width <= 500;
    return Expanded(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: isMobile
                ? const EdgeInsets.symmetric(horizontal: 20)
                : const EdgeInsets.symmetric(horizontal: 300),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 45,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Haider Nawaz",
                      style: introStyle(isMobile),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    _navigationWidget(isMobile),
                    const SizedBox(
                      height: 35,
                    ),
                    _titleWidget(Colors.white, "Hi, I'm haider", isMobile),
                    const SizedBox(
                      height: 0,
                    ),
                    _landingWidget(isMobile),
                    const SizedBox(
                      height: 35,
                    ),
                    _aboutText(),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: _titleWidget(
                          const Color(0xffAF73BB), "Catalog", isMobile),
                    ),
                    const ProjectsCatalog(),
                    _titleWidget(const Color(0xffAF73BB), "Socials", isMobile),
                    Text(
                      "You can find me on these platforms.",
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            launchUrl(
                                Uri.parse(
                                    'https://www.linkedin.com/in/haider-nawaz1/'),
                                mode: LaunchMode.platformDefault);
                          },
                          child: SvgPicture.asset(
                            'assets/icons8-linkedin.svg',
                            height: 55,
                            width: 55,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        InkWell(
                          onTap: () {
                            launchUrl(
                                Uri.parse(
                                    'https://www.instagram.com/haiderr.nawaz/'),
                                mode: LaunchMode.platformDefault);
                          },
                          child: SvgPicture.asset(
                            'assets/icons8-instagram.svg',
                            height: 55,
                            width: 55,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        // InkWell(
                        //   onTap: () {
                        //     launchUrl(
                        //         Uri.parse(
                        //             'https://www.fiverr.com/haider_nawaz'),
                        //         mode: LaunchMode.platformDefault);
                        //   },
                        //   child: SvgPicture.asset(
                        //     'assets/icons8-fiverr.svg',
                        //     height: 55,
                        //     width: 55,
                        //   ),
                        // ),
                        // const SizedBox(
                        //   width: 15,
                        // ),
                        // InkWell(
                        //   onTap: () {
                        //     launchUrl(
                        //         Uri.parse(
                        //             'https://www.upwork.com/freelancers/~01b6b1f165ad30216f'),
                        //         mode: LaunchMode.platformDefault);
                        //   },
                        //   child: SvgPicture.asset(
                        //     'assets/icons8-upwork-3.svg',
                        //     height: 55,
                        //     width: 55,
                        //     //color: Colors.black,
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle introStyle(bool isMobile) => GoogleFonts.quicksand(
        fontSize: isMobile ? 35 : 50,
        fontWeight: FontWeight.bold,
        color: const Color(0xffAF73BB),
      );

  Widget _navigationWidget(bool isMobile) {
    return Container(
      height: isMobile ? 40 : 50,
      width: isMobile ? 300 : 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xffAF73BB),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // _navigationButton("Catalog", 0, () {
          //   Get.find<MainScrollController>().scrollTo(1);
          // }),
          // _navigationButton("Socials", 1, () {
          //   //Get.find<MainScrollController>().scrollToProjects();
          // }),
          // _navigationButton("Consult with me", 2, () {
          //   //Get.find<MainScrollController>().scrollToContactMe();
          // }),
        ],
      ),
    );
  }

  Widget _consultationButton() {
    return Container(
      height: 50,
      width: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xff0B6623),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Get a free consultation",
            style: GoogleFonts.quicksand(
                fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 18,
          )
        ],
      ),
    );
  }

  _navigationButton(String s, int index, Null Function() param1) {
    return InkWell(
      onTap: param1,
      onHover: (value) {
        // Make the text underline when hovered
        setState(() {
          underLineList[index] = value;
        });
      },
      child: Text(
        s,
        style: GoogleFonts.quicksand(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            decoration: underLineList[index] ? TextDecoration.underline : null,
            decorationThickness: 2,
            decorationStyle: TextDecorationStyle.solid),
      ),
    );
  }

  Widget _titleWidget(Color color, String text, bool isMobile) {
    return RichText(
      text: TextSpan(
        text: text,
        style: GoogleFonts.quicksand(
          fontSize: isMobile ? 40 : 50,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
      // an emoji can be used directly
    );
  }

  Widget _landingWidget(bool isMobile) {
    //a row with some text and a svg image
    return SizedBox(
      //width: 800,
      child: !isMobile
          ? Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    width: 310,
                    child: Text(
                      introLine,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.quicksand(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        //increase the height of the line spacing

                        height: 1.7,
                      ),
                    )),
                const SizedBox(
                  width: 40,
                ),
                Stack(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Positioned(
                      right: 0,
                      child: Image.asset(
                        "assets/flutter-logo.png",
                        width: 60,
                        height: 60,
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/code-purple.svg",
                      width: 350,
                      height: 350,
                      //color: Colors.white,
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Image.asset(
                        "assets/firebase.png",
                        width: 80,
                        height: 80,
                      ),
                    ),
                  ],
                ),
                // Gif(image: AssetImage("assets/Code.gif"))
              ],
            )
          : Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    //width: 310,
                    child: Text(
                  introLine,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.quicksand(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    //increase the height of the line spacing

                    height: 1.7,
                  ),
                )),
                const SizedBox(
                  width: 40,
                ),
                Stack(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Positioned(
                      right: 0,
                      child: Image.asset(
                        "assets/flutter-logo.png",
                        width: 60,
                        height: 60,
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/code-purple.svg",
                      width: 350,
                      height: 350,
                      //color: Colors.white,
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Image.asset(
                        "assets/firebase.png",
                        width: 80,
                        height: 80,
                      ),
                    ),
                  ],
                ),
                // Gif(image: AssetImage("assets/Code.gif"))
              ],
            ),
    );
  }

  Widget _aboutText() {
    return SizedBox(
      // width: 980,
      child: RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(children: [
          TextSpan(
            text: "Formerly, I worked at ",
            style: GoogleFonts.quicksand(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              //increase the height of the line spacing

              height: 1.7,
            ),
          ),
          TextSpan(
            text: "AppCrates",
            style: GoogleFonts.quicksand(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: const Color(0xFFAF73BB),
              //increase the height of the line spacing

              height: 1.7,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                //open the appcrates website with launch url

                launchUrl(
                    Uri(scheme: "https", host: "www.appcrates.com", path: "/"));
              },
          ),
          TextSpan(
            text:
                " as a team lead and developed an e-commerce app entirely in flutter. I've been freelancing for the past year and have developed full stack applications for businesses. I'll be graduating with a Computer Science degree this year.",
            style: GoogleFonts.quicksand(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,

              //increase the height of the line spacing

              height: 1.7,
            ),
          ),
          TextSpan(
            text:
                "\nI write every now and then. I enjoy writing about software development, technology culture and new products. I have written some articles on ",
            style: GoogleFonts.quicksand(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              //increase the height of the line spacing

              height: 1.7,
            ),
          ),
          TextSpan(
            text: "LinkedIn",
            style: GoogleFonts.quicksand(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: const Color(0xFFAF73BB),
              //increase the height of the line spacing

              height: 1.7,
            ),
          ),
          TextSpan(
            text: " and ",
            style: GoogleFonts.quicksand(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              //increase the height of the line spacing

              height: 1.7,
            ),
          ),
          TextSpan(
            text: "Medium",
            style: GoogleFonts.quicksand(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: const Color(0xFFAF73BB),
              //increase the height of the line spacing

              height: 1.7,
            ),
          ),
          TextSpan(
            text:
                ". I also create content around software development, flutter,  productivity and tech. ",
            style: GoogleFonts.quicksand(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              //increase the height of the line spacing

              height: 1.7,
            ),
          )
        ]),
      ),
    );
  }
}
