import 'dart:convert';

import '../../domain/entities/receipe_cocktail.dart';

class ReceipeCocktailModel extends ReceipeCocktail {
  

  ReceipeCocktailModel(
      {required String title,
      required String instruction,
      required String urlImg,
      required List<String> listIngredient,
      required List<String> listMeasure})
      : super(
            title: title,
            instruction: instruction,
            urlImg: urlImg,
            listIngredient: listIngredient,
            listMeasure: listMeasure);

  factory ReceipeCocktailModel.fromJson(Map<String, dynamic> json) {
    List<String> lIngr = [];
  List<String> lMeas = [];
    String ingredient;
    for (int i = 1; i <= 15; i++) {
      ingredient = json['strIngredient$i'];
      if (ingredient != null) {
        lIngr.add(ingredient);
      }
    }

    String measure;
    for (int i = 1; i <= 15; i++) {
      measure = json['strMeasure$i'];
      if (measure != null) {
        lMeas.add(measure);
      }
    }

    return ReceipeCocktailModel(
      title: json['strDrink'],
      instruction: json['strInstructions'],
      urlImg: json['strDrinkThumb'],
      listIngredient: lIngr,
      listMeasure: lMeas,
    );
  }

  /*Map<String, dynamic> toJson() {
    int sizeLIngr = lIngr.length;
    return {
      'strDrink': title,
      'strInstructions': instruction,
      'strDrinkThumb': urlImg,
      'strIngredient$i
      /*'strIngredient1': listIngredient[0],
      'strIngredient2': listIngredient[1],
      'strIngredient3': listIngredient[2],
      'strIngredient4': listIngredient[3],
      'strIngredient5': listIngredient[4],
      'strIngredient6': listIngredient[5],
      'strIngredient7': listIngredient[6],
      'strIngredient8': listIngredient[7],
      'strIngredient9': listIngredient[8],
      'strIngredient10': listIngredient[9],
      'strIngredient11': listIngredient[10],
      'strIngredient12': listIngredient[11],
      'strIngredient13': listIngredient[12],
      'strIngredient14': listIngredient[13],
      'strIngredient15': listIngredient[14],
      'strMeasure1': listIngredient[0],
      'strMeasure2': listIngredient[1],
      'strMeasure3': listIngredient[2],
      'strMeasure4': listIngredient[3],
      'strMeasure5': listIngredient[4],
      'strMeasure6': listIngredient[5],
      'strMeasure7': listIngredient[6],
      'strMeasure8': listIngredient[7],
      'strIngredient9': listIngredient[8],
      'strIngredient10': listIngredient[9],
      'strIngredient11': listIngredient[10],
      'strIngredient12': listIngredient[11],
      'strIngredient13': listIngredient[12],
      'strIngredient14': listIngredient[13],
      'strIngredient15': listIngredient[14],*/
    };
  }*/
}
