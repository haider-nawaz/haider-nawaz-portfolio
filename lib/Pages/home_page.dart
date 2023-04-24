import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haider_nawaz_portfolio_website/Pages/about_me.dart';
import 'package:haider_nawaz_portfolio_website/constants.dart';

import '../Controllers/main_scroll_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final String introLine =
      "Freelance Flutter Developer - I build production-grade apps for mobile, web, and desktop using Flutter and Firebase.";
  @override
  Widget build(BuildContext context) {
    bool isDesktop = Get.width > 890;

    final scrollController = Get.find<MainScrollController>();
    return Container(
      height: Get.size.height,
      width: Get.size.width,
      color: Colors.white,
      child: isDesktop
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hello, I'm",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        )),
                    const SizedBox(
                      height: 0,
                    ),
                    Text("Haider Nawaz",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 420,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(introLine,
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                            textStyle: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          child: const Text("Hire Me"),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        TextButton(
                          onPressed: () {
                            scrollController.scrollTo(1);
                          },
                          style: TextButton.styleFrom(
                            iconColor: kPrimaryColor,
                            backgroundColor: kPrimaryColor.withOpacity(0.1),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                            textStyle: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          child: Text(
                            "More About me",
                            style: GoogleFonts.poppins(
                              color: kPrimaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Stack(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Positioned(
                      right: 0,
                      child: Image.asset(
                        "assets/flutter-logo.png",
                        width: 80,
                        height: 80,
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/code.svg",
                      width: Get.size.width * 0.45,
                      height: Get.size.height * 0.45,
                      //color: Colors.white,
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Image.asset(
                        "assets/firebase.png",
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ],
                )
              ],
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Hello, I'm",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        )),
                    const SizedBox(
                      height: 0,
                    ),
                    Text("Haider Nawaz",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 320,
                      child: Text(introLine,
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            textStyle: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          child: const Text("Hire Me"),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        TextButton(
                          onPressed: () {
                            scrollController.scrollTo(1);
                          },
                          style: TextButton.styleFrom(
                            iconColor: kPrimaryColor,
                            backgroundColor: kPrimaryColor.withOpacity(0.1),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            textStyle: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          child: Text(
                            "More About me",
                            style: GoogleFonts.poppins(
                              color: kPrimaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Stack(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Positioned(
                          right: 0,
                          child: Image.asset(
                            "assets/flutter-logo.png",
                            width: 80,
                            height: 80,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            "assets/code.svg",
                            width: Get.size.width * 0.45,
                            height: Get.size.height * 0.45,
                            //color: Colors.white,
                          ),
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: Image.asset(
                            "assets/firebase.png",
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
