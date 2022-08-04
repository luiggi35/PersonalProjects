import 'package:equatable/equatable.dart';

class ReceipeCocktail extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  final String title;
  final String instruction;
  final String urlImg;
  final List<String> listIngredient;
  final List<String> listMeasure;

  const ReceipeCocktail(
      {required this.title,
      required this.instruction,
      required this.urlImg,
      required this.listIngredient,
      required this.listMeasure});
}
