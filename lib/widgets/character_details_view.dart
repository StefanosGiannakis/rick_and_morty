import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character_details.dart';

import 'common_character_details.dart';

class CharacterDetailsView extends StatelessWidget {
  final CharacterDetails characterDetails;
  const CharacterDetailsView({
    Key? key,
    required this.characterDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(characterDetails.name,
            style: const TextStyle(color: Colors.white)),
      ),
      backgroundColor: const Color.fromARGB(36, 40, 47, 1),
      body: SafeArea(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: characterDetails.image,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => const SizedBox(
                height: 400,
                child: CircularProgressIndicator(),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 8.0),
                    CommonCharacterDetails(
                      character: characterDetails,
                    ),
                    CommonCharacterDetails(
                      character: characterDetails,
                    ),
                    Text(
                      characterDetails.status,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 8.0),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
