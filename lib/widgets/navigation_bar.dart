import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haider_nawaz_portfolio_website/constants.dart';

import '../Controllers/main_scroll_controller.dart';

class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController = Get.find<MainScrollController>();
    return Container(
      color: Colors.white,
      padding: MediaQuery.of(context).size.width > 890
          ? const EdgeInsets.symmetric(vertical: 20, horizontal: 25)
          : const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        MediaQuery.of(context).size.width > 890
            ? Obx(() => Text(
                  'Haider Nawaz',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: scrollController.pageIndex.value == 0
                        ? kPrimaryColor
                        : Colors.black,
                    decoration: TextDecoration.combine([
                      //TextDecoration.underline,
                      // TextDecoration.overline,
                    ]),
                  ),
                ))
            : const SizedBox(),
        //if (MediaQuery.of(context).size.width > 890)
        // Obx(
        //   () => Text(
        //     scrollController.pageIndex.value == 0 ? "" : "About Me",
        //     style: GoogleFonts.poppins(
        //       fontSize: 22,
        //       fontWeight: FontWeight.bold,
        //       color: kPrimaryColor,
        //     ),
        //   ),
        // ),
        Text(
          'Made with ❤️ using Flutter',
          style: GoogleFonts.poppins(
            fontSize: MediaQuery.of(context).size.width > 890 ? 16 : 12,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ]),
      //     Row(
      //       //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         SvgPicture.asset(
      //           'linkedin.svg',
      //           height: 25,
      //           width: 25,
      //         ),
      //         const SizedBox(
      //           width: 10,
      //         ),
      //         SvgPicture.asset(
      //           'instagram.svg',
      //           height: 25,
      //           width: 25,
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}
