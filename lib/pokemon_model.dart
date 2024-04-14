import 'package:flutter/material.dart';

class PokemonModel {
  int? id;
  String? num;
  String? name;
  String? img;
  String? type;
  String? height;
  String? weight;
  String? candy;
  int? candyCount;
  String? egg;
  double? spawnChance;
  double? avgSpawns;
  String? spawnTime;
  List<double>? multipliers;
  String? prevEvolution;
  List<String>? weaknesses;
  List<Map<String, String>>? nextEvolution;
  Color? color;

  PokemonModel(
      {required this.id,
      required this.num,
      required this.name,
      required this.img,
      required this.type,
      required this.height,
      required this.weight,
      required this.candy,
      required this.candyCount,
      required this.egg,
      required this.spawnChance,
      required this.avgSpawns,
      required this.spawnTime,
      required this.multipliers,
      required this.weaknesses,
      required this.nextEvolution,
      required this.color,
      required this.prevEvolution});

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    List<Map<String, String>> nextEvolutionList = [];
    if (json['next_evolution'] != null) {
      nextEvolutionList = List<Map<String, String>>.from(
        json['next_evolution'].map((evolution) {
          return {
            "num": evolution['num'].toString(),
            "name": evolution['name'].toString(),
          };
        }),
      );
    }

    List<double> multipliersList = [];
    if (json['multipliers'] != null) {
      multipliersList = List<double>.from(json['multipliers']
          .map((multiplier) => double.parse(multiplier.toString())));
    }

    Map<String, Color> typeColors = {
      'Poison': Colors.purple,
      'Ground': Colors.brown,
      'Rock': Colors.blueGrey,
      'Bug': Colors.lightGreen,
      'Ghost': Colors.indigo,
      'Steel': Colors.lime,
      'Fire': Colors.orange,
      'Water': Colors.blue,
      'Grass': Colors.green,
      'Electric': Colors.yellow,
      'Psychic': Colors.pink,
      'Ice': Colors.cyan,
      'Dragon': Colors.indigo,
      'Fairy': Colors.pink,
      'Fighting': Colors.red,
    };

    String pokeType = List<String>.from(json['type']).elementAt(0);

    String? prevEvolution;
    if (json['prev_evolution'] != null) {
      prevEvolution = json['prev_evolution'][0]["name"].toString();
    }

    return PokemonModel(
        id: json['id'],
        num: json['num'],
        name: json['name'],
        img: json['img'],
        type: pokeType,
        height: json['height'].toString(),
        weight: json['weight'].toString(),
        candy: json['candy'].toString(),
        candyCount: json['candy_count'],
        egg: json['egg'].toString(),
        spawnChance: double.parse(json['spawn_chance'].toString()),
        avgSpawns: json['avg_spawns'].toDouble(),
        spawnTime: json['spawn_time'].toString(),
        multipliers: multipliersList,
        weaknesses: List<String>.from(
            json['weaknesses'].map((weakness) => weakness.toString())),
        nextEvolution: nextEvolutionList,
        prevEvolution: prevEvolution,
        color: typeColors.containsKey(pokeType)
            ? typeColors[pokeType]
            : typeColors["Poison"]);
  }
}
