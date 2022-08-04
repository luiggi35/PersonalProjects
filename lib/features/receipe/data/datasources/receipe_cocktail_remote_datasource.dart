import '../models/receipe_cocktail_model.dart';

abstract class ReceipeCocktailRemoteDataSource {
  Future<ReceipeCocktailModel> getRandomCocktailReceipe();
}
