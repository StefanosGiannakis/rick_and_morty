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
        child: Scrollbar(
          isAlwaysShown: true,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: characterDetails.image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const SizedBox(
                    height: 400,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
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
                    ],
                  ),
                ),
                DisplayEpisodes(
                  episode: characterDetails.episode,
                )
              ],
            ),
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
  final List<dynamic> episode;

  const DisplayEpisodes({
    Key? key,
    required this.episode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: const Text(
            'Episodes:',
            style: TextStyle(color: Colors.white38, fontSize: 12),
          ),
        ),
        const SizedBox(height: 2),
        ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: episode.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: (index % 2 == 0)
                    ? Colors.blue.shade50
                    : Colors.orange.shade50,
                child: ListTile(
                  title: Text(
                    '🎥  ${episode[index]}',
                    maxLines: 1,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ),
              );
            }),
      ],
    );
  }
}
