import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDW-VWQyyZXWou3K17eItwqu3ikzrld208",
        appId: "1:653783176441:web:562b2e68d62441edae7e28",
        messagingSenderId: "653783176441",
        storageBucket: "haider-nawaz-portfolio.appspot.com",
        projectId: "haider-nawaz-portfolio"),
  );
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
          const Scaffold(backgroundColor: Color(0xff222122), body: HomePage()),
    );
  }
}
