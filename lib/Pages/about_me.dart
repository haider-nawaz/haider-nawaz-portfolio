import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haider_nawaz_portfolio_website/constants.dart';

import '../Controllers/main_scroll_controller.dart';
import '../widgets/skill_card.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  final String aboutMe = """
I am a Flutter developer based in Pakistan, and a final year Computer Science student with a passion for building apps. With over a year of freelancing experience on major platforms like Fiverr and Upwork, I have honed my skills in developing high-quality mobile, web, and desktop applications that meet the needs of clients from various industries.

As someone who has also worked in software houses, I have gained valuable industry experience and developed a keen eye for detail and quality. I take pride in my ability to convert your ideas into beautiful reality, and I strive to exceed your expectations with every project. 

Whether you're looking for a simple mobile app or a complex enterprise solution, I am here to help you bring your vision to life. Let's work together to create something amazing!


""";

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Get.width > 890;
    return Container(
      height: Get.size.height,
      width: Get.size.width,
      color: Colors.white,

      //give the containar a border radius and a color and a box shadow

      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isDesktop
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        skillsWidget(isDesktop),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "A little back story",
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              // decoration: BoxDecoration(
                              //   color: kPrimaryColor,
                              //   borderRadius: BorderRadius.circular(15),
                              // ),
                              width: 500,
                              child: Text(
                                aboutMe,
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: skillsWidget(isDesktop)),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "A little back story",
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            // decoration: BoxDecoration(
                            //   color: kPrimaryColor,
                            //   borderRadius: BorderRadius.circular(15),

                            // ),
                            width: 300,
                            height: 500,
                            child: Text(
                              aboutMe,
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
              //2 bottons, 1 for going back and 1 for going forward
              //const Spacer(),
              //if (isDesktop)
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        //call the method scrollBack from MainScrollController
                        Get.find<MainScrollController>().scrollBack();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              const Icon(Icons.arrow_back, color: Colors.white),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Go Back",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            //const Icon(, color: Colors.white),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Check out some of my work",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget skillsWidget(bool isDesktop) {
    // a grid view to display some cards about my skils. The cards will have differnt width and hights but the whole widget will be symmetrical. Each card will be a icon, a heading, and little text about the skill
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            SkillCard(
              title: "Flutter",
              description: isDesktop
                  ? "Building production-grade apps for mobile, web, and desktop"
                  : "Building apps for mobile, web, and desktop",
              icon: Icons.mobile_friendly,
              color: Colors.blueAccent,
              widthFactor: 1,
              heightFactor: .1,
            ),
            const SizedBox(
              width: 10,
            ),
            SkillCard(
              title: "Firebase",
              description: isDesktop
                  ? "Building scalable and secure backend solutions"
                  : "Building scalable solutions",
              icon: Icons.cloud,
              color: Colors.orangeAccent,
              widthFactor: 0,
              heightFactor: .1,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SkillCard(
              title: "Dart",
              description: isDesktop
                  ? "Writing clean and efficient code"
                  : "Writing clean code",
              icon: Icons.code,
              color: Colors.black,
              widthFactor: 0,
              heightFactor: .1,
            ),
            const SizedBox(
              width: 10,
            ),
            const SkillCard(
              title: "UI/UX",
              description: "Designing beautiful and intuitive interfaces",
              icon: Icons.design_services,
              color: kPrimaryColor,
              widthFactor: 1,
              heightFactor: .1,
            ),
          ],
        ),
      ],
    );
  }
}
