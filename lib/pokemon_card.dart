import 'package:flutter/material.dart';
import 'package:mock_mid_2/pokemon_model.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, required this.data});

  final PokemonModel data;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: data.color,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
        child: Row(
          children: [
            Column(
              children: [
                Text(
                  data.name.toString(),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black.withOpacity(0.3),
                    ),
                    child: Text(
                      data.type.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            Column(
              children: [
                Image.network(data.img.toString(), height: 100, errorBuilder:
                    (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                  return const Placeholder(
                    fallbackHeight: 50,
                    fallbackWidth: 50,
                    color: Colors.grey,
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
