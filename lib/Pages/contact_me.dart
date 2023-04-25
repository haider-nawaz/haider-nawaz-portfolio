import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haider_nawaz_portfolio_website/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMeScreen extends StatefulWidget {
  @override
  _ContactMeScreenState createState() => _ContactMeScreenState();
}

class _ContactMeScreenState extends State<ContactMeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> sendWhatsapp() async {
    const countryCode = '92';
    const contactNo = '3098605398';
    await launchUrl(Uri.parse('https://wa.me/$countryCode$contactNo?text=Hi'),
        mode: LaunchMode.platformDefault);
  }

  Future<void> sendEmail() async {
    const subject = 'Portfolio Contact Form Submission';
    const body = '';

    final emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'haidernawaz737@gmail.com',
      queryParameters: {
        'subject': subject,
        'body': body,
      },
    );

    //final emailLaunchUriEncoded = Uri.encodeFull(urlString);
    await launchUrl(emailLaunchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: !(MediaQuery.of(context).size.width > 600)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Quick Contact",
                        style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      //a whatsapp button and an email button
                      const SizedBox(height: 5),
                      Text(
                        "Feel free to contact me. I am always open to discussing new projects, creative ideas or opportunities to be part of your visions.",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      //a whatsapp button and an email button
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          whatsappButton(),
                          const SizedBox(
                            width: 15,
                          ),
                          emailButton()
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Find me here",
                        style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "You can find me on these platforms.",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              launchUrl(
                                  Uri.parse(
                                      'https://www.linkedin.com/in/haider-nawaz1/'),
                                  mode: LaunchMode.platformDefault);
                            },
                            child: SvgPicture.asset(
                              'icons8-linkedin.svg',
                              height: 35,
                              width: 35,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              launchUrl(
                                  Uri.parse(
                                      'https://www.instagram.com/haiderr.nawaz/'),
                                  mode: LaunchMode.platformDefault);
                            },
                            child: SvgPicture.asset(
                              'icons8-instagram.svg',
                              height: 35,
                              width: 35,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              launchUrl(
                                  Uri.parse(
                                      'https://www.fiverr.com/haider_nawaz'),
                                  mode: LaunchMode.platformDefault);
                            },
                            child: SvgPicture.asset(
                              'icons8-fiverr.svg',
                              height: 35,
                              width: 35,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              launchUrl(
                                  Uri.parse(
                                      'https://www.upwork.com/freelancers/~01b6b1f165ad30216f'),
                                  mode: LaunchMode.platformDefault);
                            },
                            child: SvgPicture.asset(
                              'icons8-upwork-3.svg',
                              height: 35,
                              width: 35,
                              //color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                bottomBar(),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 280),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 500,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Quick Contact",
                                    style: GoogleFonts.poppins(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  //a whatsapp button and an email button
                                  const SizedBox(height: 5),
                                  Text(
                                    "Feel free to contact me. I am always open to discussing new projects, creative ideas or opportunities to be part of your visions.",
                                    textAlign: TextAlign.justify,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  //a whatsapp button and an email button
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      whatsappButton(),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      emailButton()
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Find me here",
                                  style: GoogleFonts.poppins(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "You can find me on these platforms.",
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                        height: 35,
                                        width: 35,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
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
                                        height: 35,
                                        width: 35,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        launchUrl(
                                            Uri.parse(
                                                'https://www.fiverr.com/haider_nawaz'),
                                            mode: LaunchMode.platformDefault);
                                      },
                                      child: SvgPicture.asset(
                                        'assets/icons8-fiverr.svg',
                                        height: 35,
                                        width: 35,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        launchUrl(
                                            Uri.parse(
                                                'https://www.upwork.com/freelancers/~01b6b1f165ad30216f'),
                                            mode: LaunchMode.platformDefault);
                                      },
                                      child: SvgPicture.asset(
                                        'assets/icons8-upwork-3.svg',
                                        height: 35,
                                        width: 35,
                                        //color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                bottomBar(),
              ],
            ),
    );
  }

  Widget emailButton() {
    return TextButton(
      onPressed: () {
        //scrollController.scrollTo(1);
      },
      style: TextButton.styleFrom(
        iconColor: Colors.red,
        backgroundColor: Colors.red.withOpacity(0.1),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        textStyle: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.email, color: Colors.red),
          const SizedBox(width: 5),
          Text(
            "Email Me",
            style: GoogleFonts.poppins(
              color: Colors.red,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget whatsappButton() {
    return TextButton(
      onPressed: () {
        //scrollController.scrollTo(1);
      },
      style: TextButton.styleFrom(
        iconColor: Colors.green,
        backgroundColor: Colors.green.withOpacity(0.1),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        textStyle: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.message, color: Colors.green),
          const SizedBox(width: 5),
          Text(
            "Whatsapp Me",
            style: GoogleFonts.poppins(
              color: Colors.green,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomBar() {
    //a bottom bar for the portfolio page
    return Container(
      color: kPrimaryColor,
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Row(children: [
          const SizedBox(width: 20),
          Text(
            "© 2021 Haider Nawaz",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          Text(
            "All Rights Reserved",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 20),
        ]),
      ),
    );
  }
}
