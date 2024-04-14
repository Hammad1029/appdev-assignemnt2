import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mock_mid_2/pokemon_model.dart';
import 'package:http/http.dart' as http;
import 'package:mock_mid_2/pokemon_provider.dart';
import 'package:mock_mid_2/pokemon_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PokemonProvider(),
      child: const MaterialApp(
        home: MyStateWidget(),
      ),
    );
  }
}

class MyStateWidget extends StatefulWidget {
  const MyStateWidget({Key? key}) : super(key: key);

  @override
  State<MyStateWidget> createState() => MainApp();
}

class MainApp extends State<MyStateWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PokemonProvider>(context, listen: false).getAllPokemons();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: Scaffold(
          body: Consumer<PokemonProvider>(builder: (context, value, child) {
        if (value.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
              child: Text(
                "Pokedex",
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            Expanded(
                child: SizedBox(child: PokemonList(pokemons: value.pokemons)))
          ],
        );
      })),
    );
  }
}
