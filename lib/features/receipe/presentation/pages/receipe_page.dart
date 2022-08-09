import 'package:cocktail/features/receipe/presentation/bloc/receipe_cocktail_bloc.dart';
import 'package:cocktail/features/receipe/presentation/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../widgets/recipe_controls.dart';

class ReceipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: AppBarReceipe(),
        ),
        body: BlocProvider<ReceipeCocktailBloc>(
          create: (context) => sl<ReceipeCocktailBloc>(),
          child: Column(children: <Widget>[
            BlocBuilder<ReceipeCocktailBloc, ReceipeCocktailState>(
                builder: (context, state) {
              print("state : $state");
              if (state is EmptyState) {
                return Container(
                  // Third of the size of the screen
                  height: MediaQuery.of(context).size.height / 3,
                  child: Center(
                    child: Text('Start searching!'),
                  ),
                );
              } else if (state is LoadingState) {
                return Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state is LoadedState) {
                return /*Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: */
                    Column(
                  children: [
                    Container(
                          height: 150,
                          padding: EdgeInsets.all(5),
                          child: Image(
                            height: 50,
                            image: NetworkImage(state.receipe.urlImg,),
                          ),
                        ),
                    Row(
                      children: [
                        Text("cocktail : "),
                        Text(state.receipe.title),
                        
                        
                      ],
                    ),
                    Row(
                      children: [
                        Text("instruction : "),
                        Expanded(
                            child: Container(
                              child: Text(state.receipe.instruction),
                              padding: EdgeInsets.all(2),
                            ))
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text("liste des ingrédients"),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(8),
                        itemCount: state.receipe.listIngredient.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Text(
                            state.receipe.listIngredient[index],
                          );
                        }),
                    /*Container(padding: EdgeInsets.all(10),child: Text("liste des mesures"),),
                  ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: state.receipe.listMeasure.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Center(
                              child: Text(state.receipe.listMeasure[index])),
                        );
                      })*/
                  ],
                );
              } else if (state is Error) {
                return Container(
                  // Third of the size of the screen
                  height: MediaQuery.of(context).size.height / 3,
                  child: Center(
                    child: Text(state.message),
                  ),
                );
              } else {
                return Text('on ne rentre dans aucun état');
              }
            }),
            RecipeControls()
          ]),
        ));
  }
}
