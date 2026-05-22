import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const RecipeHub());
}

class RecipeHub extends StatelessWidget {
  const RecipeHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: "Recipe Hub",

      theme: ThemeData(
        primarySwatch: Colors.orange,

        scaffoldBackgroundColor:
            const Color(0xfff8f8f8),

        textTheme:
            GoogleFonts.poppinsTextTheme(),

        appBarTheme:
            const AppBarTheme(
          backgroundColor:
              Colors.white,
          foregroundColor:
              Colors.black,
          elevation: 0,
        ),
      ),

      home: const SplashScreen(),
    );
  }
}