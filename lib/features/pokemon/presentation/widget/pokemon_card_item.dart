import 'package:flutter/material.dart';

import '../../domain/entities/pokemon.dart';

class PokemonCardItem extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCardItem({super.key, required this.pokemon});
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(15)),
              child: FittedBox(
                fit: BoxFit.cover,
                alignment: Alignment.center,
                child: Image.network(
                  pokemon.imageUrl,
                  width: 150,
                  height: 150,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "${pokemon.name}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ))
          ],
        ));
  }
}
