import 'package:flutter/material.dart';
import 'package:mock_mid_2/pokemon_model.dart';
import 'package:mock_mid_2/pokemon_service.dart';

class PokemonProvider extends ChangeNotifier {
  final _service = PokemonService();
  bool isLoading = false;
  List<PokemonModel> pokemons = [];
  List<PokemonModel> get getPokemons => pokemons;

  Future<void> getAllPokemons() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getAll();

    pokemons = response;
    isLoading = false;
    notifyListeners();
  }
}
