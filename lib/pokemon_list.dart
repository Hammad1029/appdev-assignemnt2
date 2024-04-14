import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mock_mid_2/pokemon_model.dart';
import 'package:mock_mid_2/pokemon_details.dart';
import 'package:mock_mid_2/pokemon_card.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({super.key, required this.pokemons});

  final List<PokemonModel> pokemons;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int idx) {
        var data = pokemons.elementAt(idx);
        return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PokemonDetails(
                    data: data,
                  ),
                ),
              );
            },
            child: PokemonCard(data: data));
      },
      itemCount: pokemons.length,
    );
  }
}
