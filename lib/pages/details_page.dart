import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/character_details_bloc.dart';
import 'package:rick_and_morty/mixins/description_helpers.dart';
import 'package:rick_and_morty/widgets/character_details_view.dart';

class DetailsPage extends StatelessWidget with DescriptionHelpers {
  final int characterId;
  const DetailsPage({Key? key, required this.characterId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharacterDetailsBloc()
        ..add(
          FetchCharacterDetails(characterId: characterId),
        ),
      child: BlocBuilder<CharacterDetailsBloc, CharacterDetailsState>(
        builder: (context, state) {
          switch (state.status) {
            case CharacterDetailsStatus.failure:
              return const Center(
                  child: Text(
                'Failed to fetch character details',
                style: TextStyle(
                  color: Colors.white,
                ),
              ));
            case CharacterDetailsStatus.success:
              return CharacterDetailsView(
                characterDetails: state.characterDetails,
              );
            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
