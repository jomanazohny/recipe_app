import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../services/api_service.dart';
import 'favorites_screen.dart';
import 'recipe_details_screen.dart';
import 'search_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      const Color(0xffF6F7FB),

      appBar: AppBar(

        elevation:0,

        title:
        const Text(

          "Recipe Hub",

          style:
          TextStyle(

            fontSize:30,

            fontWeight:
            FontWeight.bold,
          ),
        ),

        actions:[

          Padding(

            padding:
            const EdgeInsets.only(
                right:15),

            child:
            CircleAvatar(

              backgroundColor:
              Colors.orange,

              child:
              IconButton(

                onPressed:(){

                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder:(_)=>

                      const SearchScreen(),
                    ),
                  );
                },

                icon:
                const Icon(

                  Icons.search,

                  color:
                  Colors.white,
                ),
              ),
            ),
          )
        ],
      ),

      drawer:
      Drawer(

        child:
        ListView(

          padding:
          EdgeInsets.zero,

          children:[

            Container(

              height:230,

              decoration:
              const BoxDecoration(

                gradient:
                LinearGradient(

                  colors:[

                    Colors.orange,

                    Colors.deepOrange,
                  ],
                ),
              ),

              child:
              const Column(

                mainAxisAlignment:
                MainAxisAlignment.center,

                children:[

                  CircleAvatar(

                    radius:45,

                    backgroundColor:
                    Colors.white,

                    child:
                    Icon(

                      Icons.restaurant,

                      size:45,

                      color:
                      Colors.orange,
                    ),
                  ),

                  SizedBox(
                    height:15,
                  ),

                  Text(

                    "Recipe Hub",

                    style:
                    TextStyle(

                      color:
                      Colors.white,

                      fontSize:30,

                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  SizedBox(
                    height:8,
                  ),

                  Text(

                    "Cook something amazing",

                    style:
                    TextStyle(
                      color:
                      Colors.white70,
                    ),
                  )
                ],
              ),
            ),

            ListTile(

              leading:
              const Icon(
                  Icons.home),

              title:
              const Text(
                  "Home"),

              onTap:(){

                Navigator.pop(
                    context);
              },
            ),

            ListTile(

              leading:
              const Icon(
                  Icons.search),

              title:
              const Text(
                  "Search"),

              onTap:(){

                Navigator.push(
                  context,

                  MaterialPageRoute(
                    builder:(_)=>

                    const SearchScreen(),
                  ),
                );
              },
            ),

            ListTile(

              leading:
              const Icon(
                  Icons.favorite),

              title:
              const Text(
                  "Favorites"),

              onTap:(){

                Navigator.push(

                  context,

                  MaterialPageRoute(
                    builder:(_)=>

                    const FavoritesScreen(),
                  ),
                );
              },
            )
          ],
        ),
      ),

      body:
      Padding(

        padding:
        const EdgeInsets.all(
            20),

        child:
        Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,

          children:[

            Container(

              width:
              double.infinity,

              height:190,

              decoration:
              BoxDecoration(

                borderRadius:
                BorderRadius.circular(
                    35),

                gradient:
                const LinearGradient(

                  colors:[

                    Color(0xffff9f43),

                    Color(0xffff6b35),
                  ],
                ),

                boxShadow:[

                  BoxShadow(

                    color:
                    Colors.orange
                        .withOpacity(.3),

                    blurRadius:20,

                    offset:
                    const Offset(
                        0,10),
                  )
                ],
              ),

              child:
              const Padding(

                padding:
                EdgeInsets.all(
                    25),

                child:
                Column(

                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  mainAxisAlignment:
                  MainAxisAlignment.center,

                  children:[

                    Text(

                      "Discover\nGreat Recipes",

                      style:
                      TextStyle(

                        color:
                        Colors.white,

                        fontSize:32,

                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    SizedBox(
                        height:10),

                    Text(

                      "Find recipes from all around the world",

                      style:
                      TextStyle(

                        color:
                        Colors.white70,

                        fontSize:16,
                      ),
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(
              height:30,
            ),

            const Text(

              "Popular Recipes",

              style:
              TextStyle(

                fontSize:25,

                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(
                height:15),

            Expanded(

              child:
              FutureBuilder<
                  List<Meal>>(

                future:
                apiService
                    .fetchMeals(),

                builder:
                    (context,
                    snapshot){

                  if(snapshot.connectionState
                      ==
                      ConnectionState
                          .waiting){

                    return
                    const Center(

                      child:
                      CircularProgressIndicator(),
                    );
                  }

                  if(snapshot.hasError){

                    return
                    const Center(

                      child:
                      Text(
                          "Could not load recipes"),
                    );
                  }

                  if(!snapshot.hasData){

                    return const SizedBox();
                  }

                  final meals=
                  snapshot.data!;

                  return ListView.builder(

                    itemCount:
                    meals.length,

                    itemBuilder:
                        (context,index){

                      Meal meal=
                      meals[index];

                      return GestureDetector(

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

                        child:
                        Container(

                          margin:
                          const EdgeInsets.only(
                              bottom:18),

                          decoration:
                          BoxDecoration(

                            color:
                            Colors.white,

                            borderRadius:
                            BorderRadius.circular(
                                25),

                            boxShadow:[

                              BoxShadow(

                                color:
                                Colors.grey
                                    .withOpacity(.1),

                                blurRadius:15,
                              )
                            ],
                          ),

                          child:
                          Row(

                            children:[

                              ClipRRect(

                                borderRadius:

                                const BorderRadius.only(

                                  topLeft:
                                  Radius.circular(
                                      25),

                                  bottomLeft:
                                  Radius.circular(
                                      25),
                                ),

                                child:
                                Image.network(

                                  meal.image,

                                  width:120,

                                  height:120,

                                  fit:
                                  BoxFit.cover,
                                ),
                              ),

                              Expanded(

                                child:
                                Padding(

                                  padding:
                                  const EdgeInsets.all(
                                      15),

                                  child:
                                  Column(

                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,

                                    children:[

                                      Text(

                                        meal.name,

                                        maxLines:2,

                                        overflow:
                                        TextOverflow.ellipsis,

                                        style:
                                        const TextStyle(

                                          fontSize:18,

                                          fontWeight:
                                          FontWeight.bold,
                                        ),
                                      ),

                                      const SizedBox(
                                        height:10,
                                      ),

                                      const Row(

                                        children:[

                                          Icon(
                                            Icons.star,

                                            color:
                                            Colors.amber,

                                            size:18,
                                          ),

                                          Text(
                                            " 4.8",
                                          ),

                                          SizedBox(
                                              width:10),

                                          Icon(
                                            Icons.timer,

                                            size:18,

                                            color:
                                            Colors.orange,
                                          ),

                                          Text(
                                            " 30 min",
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
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