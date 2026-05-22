import 'dart:async';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState
    extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController
      controller;

  late Animation<double>
      animation;

  @override
  void initState() {

    super.initState();

    controller =
        AnimationController(

      vsync:this,

      duration:
      const Duration(
          seconds:2),
    );

    animation=
        CurvedAnimation(

      parent:
      controller,

      curve:
      Curves.easeInOut,
    );

    controller.repeat(
        reverse:true);

    Timer(

      const Duration(
          seconds:4),

          (){

        Navigator.pushReplacement(

          context,

          MaterialPageRoute(
            builder:(_)=>

                HomeScreen(),
          ),
        );
      },
    );
  }

  @override
  void dispose(){

    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(
      BuildContext context){

    return Scaffold(

      body:

      Container(

        width:
        double.infinity,

        decoration:
        const BoxDecoration(

          gradient:
          LinearGradient(

            colors:[

              Colors.orange,

              Colors.deepOrange,
            ],

            begin:
            Alignment.topLeft,

            end:
            Alignment.bottomRight,
          ),
        ),

        child:
        Center(

          child:
          FadeTransition(

            opacity:
            animation,

            child:
            Column(

              mainAxisAlignment:
              MainAxisAlignment.center,

              children:[

                Container(

                  padding:
                  const EdgeInsets.all(
                      20),

                  decoration:
                  const BoxDecoration(

                    color:
                    Colors.white,

                    shape:
                    BoxShape.circle,
                  ),

                  child:
                  const Icon(

                    Icons.restaurant,

                    size:70,

                    color:
                    Colors.orange,
                  ),
                ),

                const SizedBox(
                  height:25,
                ),

                const Text(

                  "Recipe Hub",

                  style:
                  TextStyle(

                    color:
                    Colors.white,

                    fontSize:36,

                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height:10,
                ),

                const Text(

                  "Discover Delicious Recipes",

                  style:
                  TextStyle(

                    color:
                    Colors.white70,

                    fontSize:18,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}