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
    void displayList(List l) {
      for (int i = 0; i < l.length; i++) {
        print(l[i]);
      }
    }

    print("");
    print("liste ingrédients");
    //displayListString(listIngr);
    print("");
    print("liste mesures");
    //displayListString(listMeas);

    print("nom du cocktail");
    print(json["drinks"][0]['strDrink']);
    print(json["drinks"][0]['strInstructions']);
    print(json["drinks"][0]['strInstructions']);
    print(json["drinks"][0]['strDrinkThumb']);
    /*List<String> lIngr = [];
    List<String> lMeas = [];*/
    List<String> listIngr = [];
    String ingredient = "";
    var j;
    for (int i = 1; i < 16; i++) {
      print("type de strNULL");
      j = json["drinks"][0]['strIngredient$i'].runtimeType;
      print(j);

      if (j != Null) {
        ingredient = json["drinks"][0]['strIngredient$i'];
        listIngr.add(ingredient);
      }
    }

    List<String> listMeas = [];
    String measure = "";
    var k;
    for (int i = 1; i < 16; i++) {
      print("type de strNULL");
      k = json["drinks"][0]['strMeasure$i'].runtimeType;
      print(k);

      if (k != Null) {
        measure = json["drinks"][0]['strMeasure$i'];
        listMeas.add(measure);
      }
    }

    print("");
    print("liste ingrédients");
    displayList(listIngr);
    print("");
    print("liste mesures");
    displayList(listMeas);
    return ReceipeCocktailModel(
      title: json["drinks"][0]['strDrink'],
      instruction: json["drinks"][0]['strInstructions'],
      urlImg: json["drinks"][0]['strDrinkThumb'],
      listIngredient: listIngr,
      listMeasure: listMeas,
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
