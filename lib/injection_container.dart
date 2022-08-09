import 'package:cocktail/features/receipe/data/datasources/receipe_cocktail_remote_datasource_impl.dart';
import 'package:cocktail/features/receipe/presentation/bloc/receipe_cocktail_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/receipe/data/datasources/receipe_cocktail_remote_datasource.dart';
import 'features/receipe/data/repositories/receipe_cocktail_repository_impl.dart';
import 'features/receipe/domain/repositories/receipe_cocktail_repository.dart';
import 'features/receipe/domain/usecases/get_random_cocktail_receipe_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async{
  //Bloc
  sl.registerFactory(() => ReceipeCocktailBloc(randomCocktailReceipe: sl()));

  //Usecases
  sl.registerLazySingleton(() => GetRandomCocktailReceipe(sl()));

  //Repositories
  sl.registerLazySingleton<ReceipeCocktailRepository>(
    () => ReceipeCocktailRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  //DataSources
  sl.registerLazySingleton<ReceipeCocktailRemoteDataSource>(() => ReceipeCocktailRemoteDataSourceImpl());
}
