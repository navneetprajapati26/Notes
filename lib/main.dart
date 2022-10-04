import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes/pages/HomeScreen.dart';
import 'package:notes/pages/SplashScreen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen()
      // AnimatedSplashScreen(
      //   duration: 3000,
      //   splash: "assets/note.png",
      //   nextScreen: HomeScreen(),
      //
      // ),
    );
  }
}
