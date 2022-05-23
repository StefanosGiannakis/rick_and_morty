import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character.dart';

class DetailsPage extends StatelessWidget {
  final Character character;
  const DetailsPage({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(character.name, style: const TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(character.location.name),
      ),
    );
  }
}
