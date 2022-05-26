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
        child: SingleChildScrollView(
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
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10.0),
                    CommonCharacterDetails(
                      character: characterDetails,
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Gender:',
                      style: TextStyle(color: Colors.white38, fontSize: 12),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      characterDetails.gender,
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Episodes:',
                      style: TextStyle(color: Colors.white38, fontSize: 12),
                    ),
                    const SizedBox(height: 2),
                    // ListView.builder(itemBuilder: itemBuilder)
                    Text(
                      characterDetails.origin.name,
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
