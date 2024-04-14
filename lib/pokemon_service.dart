import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mock_mid_2/pokemon_model.dart';

class PokemonService {
  Future<List<PokemonModel>> getAll() async {
    const url =
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> pokemonList = json['pokemon'];
      final todos = pokemonList.map((e) {
        return PokemonModel.fromJson(e);
      }).toList();
      return todos;
    }
    return [];
  }
}
