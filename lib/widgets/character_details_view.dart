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
                    DisplayGender(gender: characterDetails.gender),
                    const SizedBox(height: 12),
                    DisplayEpisodes(episodes: characterDetails.episodes),
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

class DisplayGender extends StatelessWidget {
  final String gender;
  const DisplayGender({
    Key? key,
    required this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Gender:',
          style: TextStyle(color: Colors.white38, fontSize: 12),
        ),
        const SizedBox(height: 2),
        Text(
          gender,
          style: const TextStyle(color: Colors.white, fontSize: 13),
        ),
      ],
    );
  }
}

class DisplayEpisodes extends StatelessWidget {
  final List<String>? episodes;
  const DisplayEpisodes({
    Key? key,
    this.episodes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          'Episodes:',
          style: TextStyle(color: Colors.white38, fontSize: 12),
        ),
        SizedBox(height: 2),
        Text(
          'episodes',
          style: TextStyle(color: Colors.white, fontSize: 13),
        ),
      ],
    );
  }
}
