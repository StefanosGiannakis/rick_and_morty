import 'package:flutter/material.dart';
import 'package:rick_and_morty/mixins/description_helpers.dart';
import 'package:rick_and_morty/models/character.dart';

class CommonCharacterDetails extends StatelessWidget {
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
        DisplayName(name: character.name),
        const SizedBox(height: 2),
        DisplayStatus(status: character.status),
        const SizedBox(height: 6),
        DisplayLocation(location: character.location),
        const SizedBox(height: 12),
        DisplayOrigin(origin: character.origin),
        const SizedBox(height: 12),
      ],
    );
  }
}

class DisplayName extends StatelessWidget {
  final String name;
  const DisplayName({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
          color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
      textAlign: TextAlign.left,
    );
  }
}

class DisplayStatus extends StatelessWidget with DescriptionHelpers {
  final String status;
  late final bool isAKnownStatus = List.of(['Alive', 'Dead']).contains(status);

  DisplayStatus({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isAKnownStatus
            ? Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: getCharacterStatusColor(status),
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
                ],
              )
            : Container(),
        Text(
          status,
          style: const TextStyle(color: Colors.white, fontSize: 12),
          textAlign: TextAlign.left,
        ),
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
