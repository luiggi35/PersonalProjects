import 'package:cocktail/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/receipe_cocktail.dart';
import '../repositories/receipe_cocktail_repository.dart';

class GetRandomCocktailReceipe {
  final ReceipeCocktailRepository repo;

  GetRandomCocktailReceipe(this.repo);

  Future<Either<Failure, ReceipeCocktail>> execute() async {
    return await repo.getRandomCocktailReceipe();
  }
}
