import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/meal.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final Meal meal;

  const RecipeDetailsScreen({
    super.key,
    required this.meal,
  });

  Future<void> saveFavorite(
      BuildContext context) async {

    final prefs =
        await SharedPreferences.getInstance();

    List<String> favorites =
        prefs.getStringList(
              "favoritesData",
            ) ??
            [];

    Map<String,dynamic> data = {

      "id": meal.id,

      "name": meal.name,

      "image": meal.image,

      "instructions":
      meal.instructions,

      "category":
      meal.category,

      "area":
      meal.area,

      "ingredient1":
      meal.ingredient1,

      "ingredient2":
      meal.ingredient2,

      "ingredient3":
      meal.ingredient3,

      "ingredient4":
      meal.ingredient4,

      "ingredient5":
      meal.ingredient5,
    };

    String recipe =
        jsonEncode(data);

    if(favorites.contains(recipe)){

      ScaffoldMessenger.of(
          context)
          .showSnackBar(

        const SnackBar(
          content: Text(
            "Already in favorites ❤️",
          ),
        ),
      );

      return;
    }

    favorites.add(recipe);

    await prefs.setStringList(
      "favoritesData",
      favorites,
    );

    ScaffoldMessenger.of(
        context)
        .showSnackBar(

      const SnackBar(
        content: Text(
          "Added to favorites ❤️",
        ),
      ),
    );
  }

  @override
  Widget build(
      BuildContext context){

    return Scaffold(

      body:
      SingleChildScrollView(

        child:
        Column(

          children:[

            Stack(

              children:[

                Hero(

                  tag:
                  meal.id,

                  child:
                  Image.network(

                    meal.image,

                    width:
                    double.infinity,

                    height:
                    350,

                    fit:
                    BoxFit.cover,
                  ),
                ),

                SafeArea(

                  child:
                  IconButton(

                    onPressed:(){

                      Navigator.pop(
                          context);
                    },

                    icon:
                    const Icon(

                      Icons.arrow_back,

                      color:
                      Colors.white,

                      size:30,
                    ),
                  ),
                )
              ],
            ),

            Padding(

              padding:
              const EdgeInsets.all(
                  20),

              child:
              Column(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children:[

                  Text(

                    meal.name,

                    style:
                    const TextStyle(

                      fontSize:30,

                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                      height:15),

                  Row(

                    children:[

                      Chip(
                        label:
                        Text(
                            meal.category),
                      ),

                      const SizedBox(
                        width:10,
                      ),

                      Chip(
                        label:
                        Text(
                            meal.area),
                      ),
                    ],
                  ),

                  const SizedBox(
                      height:25),

                  const Text(

                    "Ingredients",

                    style:
                    TextStyle(

                      fontSize:24,

                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                      height:10),

                  Text(
                      "• ${meal.ingredient1}"),

                  Text(
                      "• ${meal.ingredient2}"),

                  Text(
                      "• ${meal.ingredient3}"),

                  Text(
                      "• ${meal.ingredient4}"),

                  Text(
                      "• ${meal.ingredient5}"),

                  const SizedBox(
                      height:25),

                  const Text(

                    "Instructions",

                    style:
                    TextStyle(

                      fontSize:24,

                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                      height:10),

                  Text(
                    meal.instructions,
                  ),

                  const SizedBox(
                      height:30),

                  SizedBox(

                    width:
                    double.infinity,

                    child:
                    ElevatedButton.icon(

                      onPressed:(){

                        saveFavorite(
                            context);
                      },

                      icon:
                      const Icon(
                          Icons.favorite),

                      label:
                      const Text(
                        "Add To Favorites",
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}