import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../services/api_service.dart';
import 'recipe_details_screen.dart';

class SearchScreen
    extends StatefulWidget {

  const SearchScreen({
    super.key,
  });

  @override
  State<SearchScreen>
  createState() =>
      _SearchScreenState();
}

class _SearchScreenState
extends State<SearchScreen>{

  final ApiService
  apiService=
  ApiService();

  final TextEditingController
  searchController=
  TextEditingController();

  List<Meal> meals=[];

  bool loading=false;

  Future<void>
  searchMeals()
  async{

    if(searchController
        .text
        .trim()
        .isEmpty){

      return;
    }

    setState(() {
      loading=true;
    });

    meals=

    await apiService
        .searchMeals(

      searchController
          .text
          .trim(),
    );

    setState(() {
      loading=false;
    });
  }

  @override
  Widget build(
      BuildContext context){

    return Scaffold(

      appBar:AppBar(
        title:
        const Text(
          "Search Recipes",
        ),
      ),

      body:
      Padding(

        padding:
        const EdgeInsets.all(
            20),

        child:
        Column(

          children:[

            TextField(

              controller:
              searchController,

              decoration:
              InputDecoration(

                hintText:
                "Search...",

                suffixIcon:
                IconButton(

                  icon:
                  const Icon(
                      Icons.search),

                  onPressed:
                  searchMeals,
                ),

                border:
                OutlineInputBorder(

                  borderRadius:
                  BorderRadius.circular(
                      20),
                ),
              ),
            ),

            const SizedBox(
                height:20),

            Expanded(

              child:

              loading

                  ?

              const Center(
                child:
                CircularProgressIndicator(),
              )

                  :

              ListView.builder(

                itemCount:
                meals.length,

                itemBuilder:
                    (context,index){

                  Meal meal=
                  meals[index];

                  return Card(

                    child:
                    ListTile(

                      onTap:(){

                        Navigator.push(

                          context,

                          MaterialPageRoute(

                            builder:(_)=>

                                RecipeDetailsScreen(
                                  meal:meal,
                                ),
                          ),
                        );
                      },

                      leading:
                      Image.network(
                        meal.image,
                        width:60,
                      ),

                      title:
                      Text(
                          meal.name),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}