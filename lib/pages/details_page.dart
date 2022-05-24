import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/mixins/description_helpers.dart';
import 'package:rick_and_morty/models/character.dart';
import 'package:rick_and_morty/widgets/common_character_details.dart';

class DetailsPage extends StatelessWidget with DescriptionHelpers {
  final Character character;
  const DetailsPage({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(character.name, style: const TextStyle(color: Colors.white)),
      ),
      backgroundColor: const Color.fromARGB(36, 40, 47, 1),
      body: SafeArea(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: character.image,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CircularProgressIndicator(),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CommonCharacterDetails(character: character),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
