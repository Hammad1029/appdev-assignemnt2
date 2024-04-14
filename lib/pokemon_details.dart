import 'package:flutter/material.dart';
import 'package:mock_mid_2/pokemon_model.dart';

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({super.key, required this.data});

  final PokemonModel data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: data.color,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                title: Row(
                  children: [
                    Text(
                      data.name.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      '#0${data.id.toString()}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white.withOpacity(0.8)),
                    ),
                  ],
                ),
                subtitle: Row(
                  children: [
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
                    const Spacer()
                  ],
                ), // Join the types with a comma
              ),
            ],
          ),
          bottomSheet: Container(
            height: 400,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30), // Reduced padding
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Name:",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          data.name.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Height:",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          data.height.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Weight:",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          data.weight.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Spawn Time:",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          data.spawnTime.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Weakness:",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          data.weaknesses?.join(", ").toString() ?? "",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Pre Evolution:",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          data?.prevEvolution.toString() ?? "",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Next Evolution:",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          data.nextEvolution?.isNotEmpty ?? false
                              ? data.nextEvolution
                                      ?.elementAt(0)["name"]
                                      .toString() ??
                                  ""
                              : "",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: (MediaQuery.of(context).size.width * 0.5) + 150,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: Hero(
                tag: data.id.toString(),
                child:
                    Image.network(data.img.toString(), fit: BoxFit.fitHeight)),
          ),
        ),
      ],
    );
  }
}
