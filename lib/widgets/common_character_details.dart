import 'package:flutter/material.dart';
import 'package:rick_and_morty/mixins/description_helpers.dart';
import 'package:rick_and_morty/models/abstract_character.dart';
import 'package:rick_and_morty/models/character.dart';

class CommonCharacterDetails extends StatelessWidget with DescriptionHelpers {
  final character; // @note
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
        const SizedBox(height: 4),
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
        const SizedBox(height: 5),
        const Text(
          'Last known location:',
          maxLines: 1,
          style: TextStyle(color: Colors.white38, fontSize: 12),
        ),
        const SizedBox(height: 2),
        Text(
          character.location.name,
          style: const TextStyle(color: Colors.white, fontSize: 13),
        ),
        const SizedBox(height: 12),
        const Text(
          'First seen in:',
          style: TextStyle(color: Colors.white38, fontSize: 12),
        ),
        const SizedBox(height: 2),
        Text(
          character.origin.name,
          style: const TextStyle(color: Colors.white, fontSize: 13),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
