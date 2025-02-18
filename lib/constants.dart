import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xffAF73BB);

 final List<Widget> revolvingImages = [
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