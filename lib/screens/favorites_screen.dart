import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/meal.dart';
import 'edit_note_screen.dart';
import 'recipe_details_screen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() =>
      _FavoritesScreenState();
}

class _FavoritesScreenState
    extends State<FavoritesScreen> {

  List favorites = [];
  List<String> notes = [];

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  Future<void> loadFavorites() async {

    final prefs =
    await SharedPreferences.getInstance();

    List<String> data =
        prefs.getStringList(
            "favoritesData")
            ?? [];

    favorites =
        data.map(
                (e)=>jsonDecode(e))
            .toList();

    notes =
        prefs.getStringList(
            "notes")
            ??

        List.generate(
                favorites.length,
                    (_)=>"");

    setState(() {});
  }

  Future<void> saveNotes()
  async{

    final prefs=
    await SharedPreferences
        .getInstance();

    await prefs.setStringList(
      "notes",
      notes,
    );
  }

  Future<void>
  editNote(int index)
  async{

    final result=

    await Navigator.push(

      context,

      MaterialPageRoute(

        builder:(_)=>

            EditNoteScreen(
              currentNote:
              notes[index],
            ),
      ),
    );

    if(result!=null){

      notes[index]=result;

      await saveNotes();

      setState(() {});
    }
  }

  Future<void>
  deleteFavorite(
      int index)
  async{

    final prefs=
    await SharedPreferences
        .getInstance();

    favorites.removeAt(index);

    notes.removeAt(index);

    List<String>
    updated=

    favorites
        .map(
            (e)=>
            jsonEncode(e))
        .toList();

    await prefs.setStringList(
      "favoritesData",
      updated,
    );

    await prefs.setStringList(
      "notes",
      notes,
    );

    setState(() {});
  }

  @override
  Widget build(
      BuildContext context){

    return Scaffold(

      appBar:AppBar(
        title:
        const Text(
          "Favorites ❤️",
        ),
      ),

      body:

      favorites.isEmpty

          ?

      const Center(
        child:
        Text(
            "No favorites yet"),
      )

          :

      ListView.builder(

        padding:
        const EdgeInsets.all(
            15),

        itemCount:
        favorites.length,

        itemBuilder:
            (context,index){

          return GestureDetector(

            onTap:(){

              Meal meal=
              Meal(

                id:
                favorites[index]["id"],

                name:
                favorites[index]["name"],

                image:
                favorites[index]["image"],

                instructions:
                favorites[index]["instructions"],

                category:
                favorites[index]["category"],

                area:
                favorites[index]["area"],

                ingredient1:
                favorites[index]["ingredient1"],

                ingredient2:
                favorites[index]["ingredient2"],

                ingredient3:
                favorites[index]["ingredient3"],

                ingredient4:
                favorites[index]["ingredient4"],

                ingredient5:
                favorites[index]["ingredient5"],
              );

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
                  bottom:20),

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
              ListTile(

                contentPadding:
                const EdgeInsets.all(
                    10),

                leading:
                ClipRRect(

                  borderRadius:
                  BorderRadius.circular(
                      15),

                  child:
                  Image.network(

                    favorites[index]
                    ["image"],

                    width:70,

                    fit:
                    BoxFit.cover,
                  ),
                ),

                title:
                Text(

                  favorites[index]
                  ["name"],
                ),

                subtitle:
                Text(

                  notes[index]
                      .isEmpty

                      ?

                  "Tap to view recipe"

                      :

                  notes[index],
                ),

                trailing:
                Row(

                  mainAxisSize:
                  MainAxisSize.min,

                  children:[

                    IconButton(

                      icon:
                      const Icon(
                          Icons.edit),

                      onPressed:(){

                        editNote(
                            index);
                      },
                    ),

                    IconButton(

                      icon:
                      const Icon(
                        Icons.delete,
                        color:
                        Colors.red,
                      ),

                      onPressed:(){

                        deleteFavorite(
                            index);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}