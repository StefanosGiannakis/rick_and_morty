import 'package:flutter/material.dart';
import 'package:rick_and_morty/mixins/description_helpers.dart';
import 'package:rick_and_morty/models/character.dart';
import 'package:rick_and_morty/models/character_details.dart';

class CommonCharacterDetails extends StatelessWidget with DescriptionHelpers {
  final Character character;
  const CommonCharacterDetails({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        Text(
          character.id.toString() + ' ' + character.name,
          style: const TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 2),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: getCharacterStatusColor(character.status),
                borderRadius: BorderRadius.circular(7),
              ),
              constraints: const BoxConstraints(
                minWidth: 8,
                minHeight: 8,
              ),
              child: const SizedBox(
                width: 2,
                height: 2,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              character.status,
              style: const TextStyle(color: Colors.white, fontSize: 12),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        const SizedBox(height: 6),
        DisplayLocation(location: character.location),
        const SizedBox(height: 12),
        DisplayOrigin(origin: character.origin),
        const SizedBox(height: 12),
      ],
    );
  }
}

class DisplayLocation extends StatelessWidget {
  final Location location;
  const DisplayLocation({
    Key? key,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Last known location:',
          maxLines: 1,
          style: TextStyle(color: Colors.white38, fontSize: 12),
        ),
        const SizedBox(height: 2),
        Text(
          location.name,
          style: const TextStyle(color: Colors.white, fontSize: 13),
        ),
      ],
    );
  }
}

class DisplayOrigin extends StatelessWidget {
  final Location origin;
  const DisplayOrigin({
    Key? key,
    required this.origin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'First seen in:',
          maxLines: 1,
          style: TextStyle(color: Colors.white38, fontSize: 12),
        ),
        const SizedBox(height: 2),
        Text(
          origin.name,
          style: const TextStyle(color: Colors.white, fontSize: 13),
        ),
      ],
    );
  }
}
