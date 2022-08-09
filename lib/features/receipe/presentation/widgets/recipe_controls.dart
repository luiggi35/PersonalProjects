import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/receipe_cocktail_bloc.dart';

class RecipeControls extends StatefulWidget {
  const RecipeControls({Key? key}) : super(key: key);

  @override
  _RecipeControlsState createState() => _RecipeControlsState();
}

class _RecipeControlsState extends State<RecipeControls> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return (Expanded(
      child: TextButton(
        child: Text('Get random cocktail recipe'),
        onPressed: () => dispatchRandom(context),
      ),
    ));
  }

  void dispatchRandom(BuildContext c) {
    print("send event to the bloc");
    BlocProvider.of<ReceipeCocktailBloc>(c)
      .add(GetRandomCocktailReceipeEvent());
  }
}
