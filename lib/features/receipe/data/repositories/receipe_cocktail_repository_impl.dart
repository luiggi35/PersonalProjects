import 'package:cocktail/core/error/exception.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/receipe_cocktail.dart';
import '../../domain/repositories/receipe_cocktail_repository.dart';
import '../datasources/receipe_cocktail_remote_datasource.dart';

class ReceipeCocktailRepositoryImpl implements ReceipeCocktailRepository {
  final ReceipeCocktailRemoteDataSource remoteDataSource;

  ReceipeCocktailRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ReceipeCocktail>> getRandomCocktailReceipe() async {
    print("iniside functionInDataSourceRepository");
    try {
      final remoteReceipe = await remoteDataSource.getRandomCocktailReceipe();
      print("get recette");
      return Right(remoteReceipe);
    } on ServerException {
      print("failure for get receipe");
      return Left(ServerFailure());
    }
  }
}
