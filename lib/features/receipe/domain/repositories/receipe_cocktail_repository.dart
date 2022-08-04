import 'package:cocktail/core/error/failures.dart';
import 'package:cocktail/features/receipe/domain/entities/receipe_cocktail.dart';
import 'package:dartz/dartz.dart';

abstract class ReceipeCocktailRepository {
  Future<Either<Failure, ReceipeCocktail>> getRandomCocktailReceipe();
}
