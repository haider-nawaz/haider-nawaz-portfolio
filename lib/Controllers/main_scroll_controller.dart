import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScrollController extends GetxController {
  final scrollController = ScrollController();
  //if a button is pressed, scroll the page to the desired location
  final pageIndex = 0.obs;
  // if a scroll is detected on the page, update the pageIndex
  @override
  void onInit() {
    scrollController.addListener(() {
      pageIndex.value = scrollController.offset ~/ Get.size.width;
      // scrollTo(1);
    });
    super.onInit();
  }

  void scrollTo(int index) {
    scrollController
        .animateTo(
          Get.size.width * index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        )
        .then((value) => {pageIndex.value += 1});
  }

  void scrollBack() {
    scrollController.animateTo(
      Get.size.width * (pageIndex.value - 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
    pageIndex.value -= 1;
  }
}
