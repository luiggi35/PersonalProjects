import 'package:bloc/bloc.dart';
import 'package:cocktail/features/receipe/domain/entities/receipe_cocktail.dart';
import 'package:cocktail/features/receipe/domain/usecases/get_random_cocktail_receipe_usecase.dart';
import 'package:equatable/equatable.dart';

part 'receipe_cocktail_event.dart';
part 'receipe_cocktail_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class ReceipeCocktailBloc
    extends Bloc<ReceipeCocktailEvent, ReceipeCocktailState> {
  final GetRandomCocktailReceipe randomCocktailReceipe;

  ReceipeCocktailBloc({required this.randomCocktailReceipe})
      : super(EmptyState());

  @override
  Stream<ReceipeCocktailState> mapEventToState(
      ReceipeCocktailEvent event) async* {
    if (event is GetRandomCocktailReceipeEvent) {
      yield LoadingState();
      final failureOrReceipe = await randomCocktailReceipe.execute();
      yield failureOrReceipe.fold(
          (failure) => Error(message: "failure"), (receipe) => LoadedState(receipe: receipe));
    }
  }
}
