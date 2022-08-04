import 'dart:convert';
import 'dart:io';

import 'package:cocktail/features/receipe/data/models/receipe_cocktail_model.dart';
import 'package:http/http.dart';

import 'receipe_cocktail_remote_datasource.dart';

import 'package:http/http.dart' as http;

class ReceipeCocktailRemoteDataSourceImpl
    implements ReceipeCocktailRemoteDataSource {
  @override
  Future<ReceipeCocktailModel> getRandomCocktailReceipe() async {
    const String _baseUrl =
        "https://sameer-kumar-aztro-v1.p.rapidapi.com/?sign=aquarius&day=today";
    // Base headers for Response url
    Map<String, String> _headers = {
      "X-RapidAPI-Key": "e00b36b2bbmsha6394db62d1f081p1154c4jsnb69e4850301f",
      "X-RapidAPI-Host": "the-cocktail-db.p.rapidapi.com",
    };

    Uri uri = Uri.https(_baseUrl, "");
    final response = await http.get(uri, headers: _headers);
    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      print("success");
      return ReceipeCocktailModel.fromJson(json.decode(response.body));
    } else {
      print("not success");
      throw Exception();
    }
  }
}
