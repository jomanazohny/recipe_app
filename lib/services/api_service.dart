import 'dart:convert';
import 'package:http/http.dart'
as http;

import '../models/meal.dart';

class ApiService {

  Future<List<Meal>>
  fetchMeals() async {

    final response =
    await http.get(

      Uri.parse(
          'https://www.themealdb.com/api/json/v1/1/search.php?s='
      ),
    );

    if(response.statusCode
        ==200){

      final data=
      jsonDecode(
          response.body);

      List meals=
      data['meals'];

      return meals
          .map(
              (meal)=>

              Meal.fromJson(
                  meal))
          .toList();

    }

    else{

      throw Exception(
          "Failed");
    }
  }

  Future<List<Meal>>
  searchMeals(
      String query)
  async {

    final response=
    await http.get(

      Uri.parse(
          'https://www.themealdb.com/api/json/v1/1/search.php?s=$query'
      ),
    );

    if(response.statusCode
        ==200){

      final data=
      jsonDecode(
          response.body);

      if(data["meals"]
      ==null){

        return[];
      }

      List meals=
      data["meals"];

      return meals
          .map(
              (meal)=>

              Meal.fromJson(
                  meal))
          .toList();
    }

    return[];
  }
}