part of 'receipe_cocktail_bloc.dart';

abstract class ReceipeCocktailState extends Equatable {
  const ReceipeCocktailState();

  @override
  List<Object> get props => [];
}

class EmptyState extends ReceipeCocktailState {}

class LoadingState extends ReceipeCocktailState {}

class LoadedState extends ReceipeCocktailState {
  final ReceipeCocktail receipe;

  LoadedState({required this.receipe});
}

class Error extends ReceipeCocktailState {
  final String message;

  const Error({required this.message});
}
