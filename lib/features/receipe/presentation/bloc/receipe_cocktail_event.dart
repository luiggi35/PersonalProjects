part of 'receipe_cocktail_bloc.dart';

abstract class ReceipeCocktailEvent extends Equatable {
  const ReceipeCocktailEvent();

  @override
  List<Object> get props => [];
}

class GetRandomCocktailReceipeEvent extends ReceipeCocktailEvent{}

