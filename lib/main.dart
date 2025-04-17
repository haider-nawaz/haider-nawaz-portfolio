import 'package:flutter/material.dart';
import 'Pages/home_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Haider Nawaz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          const Scaffold(backgroundColor: Color(0xff222122), body: HomePage(),),
    );
  }
}
