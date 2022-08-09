import 'dart:convert';
import 'dart:io';

import 'package:cocktail/features/receipe/data/models/receipe_cocktail_model.dart';
import 'package:http/http.dart';

import 'receipe_cocktail_remote_datasource.dart';

import 'package:http/http.dart' as http;

class ReceipeCocktailRemoteDataSourceImpl
    implements ReceipeCocktailRemoteDataSource {
  void displayMap(Map<String, dynamic> map) {
    map.forEach((key, value) {
      print(key);
      print(value);
      print("");
    });
  }

  @override
  Future<ReceipeCocktailModel> getRandomCocktailReceipe() async {
    
    const String _baseUrl = "https://the-cocktail-db.p.rapidapi.com/random.php";
    // Base headers for Response url
    Map<String, String> _headers = {
      "X-RapidAPI-Key": "e00b36b2bbmsha6394db62d1f081p1154c4jsnb69e4850301f",
      "X-RapidAPI-Host": "the-cocktail-db.p.rapidapi.com",
    };
    print("build request");

    Uri uri = Uri.parse(_baseUrl);
    print("get request");
    final response = await http.get(uri, headers: _headers);
    int codeRep = response.statusCode;
    print('response : $response  , statuscode : $codeRep');
    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      print("success");
      displayMap(json.decode(response.body));
      return ReceipeCocktailModel.fromJson(json.decode(response.body));
    } else {
      print("not success");
      throw Exception();
    }
  }
}
