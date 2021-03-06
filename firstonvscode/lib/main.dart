import 'package:firstonvscode/pages/cartPage.dart';
import 'package:firstonvscode/pages/detail.dart';
import 'package:flutter/material.dart';
import 'package:firstonvscode/pages/home_page.dart';
import 'package:firstonvscode/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MaterialApp(
    themeMode: ThemeMode.light,
    theme: ThemeData(
      primarySwatch: Colors.pink,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
    darkTheme: ThemeData(
      brightness: Brightness.dark,
    ),
    initialRoute: "/home",
    routes: {
      "/": (context) => LoginPage(),
      "/home": (context) => HomePage(),
      "/login": (context) => LoginPage(),
      "/detail": (context) => DetailPage(),
      "/cart": (context) => CartPage(),
    },
  ));
}
