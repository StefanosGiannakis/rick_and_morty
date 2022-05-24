import 'package:flutter/material.dart';
import 'package:rick_and_morty/mixins/description_helpers.dart';
import 'package:rick_and_morty/models/character.dart';

class CommonCharacterDetails extends StatelessWidget with DescriptionHelpers {
  final Character character;
  const CommonCharacterDetails({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 2.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        // @todo wrap text
        children: <Widget>[
          Text(
            character.id.toString() + ' ' + character.name,
            maxLines: 2,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
            softWrap: true,
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
                style: const TextStyle(color: Colors.white, fontSize: 14),
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text('Last known location:',
              maxLines: 2,
              style: TextStyle(color: Colors.white38, fontSize: 14)),
          const SizedBox(height: 2),
          Text(character.location.name,
              maxLines: 4,
              style: const TextStyle(color: Colors.white, fontSize: 15)),
          const SizedBox(height: 12),
          const Text('First seen in:',
              maxLines: 2,
              style: TextStyle(color: Colors.white38, fontSize: 14)),
          const SizedBox(height: 2),
          Text(character.origin.name,
              maxLines: 4,
              style: const TextStyle(color: Colors.white, fontSize: 15)),
        ],
      ),
    );
  }
}
