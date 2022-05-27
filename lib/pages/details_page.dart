import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/character_details_bloc.dart';
import 'package:rick_and_morty/cubit/views_counter_cubit.dart';
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
          CharacterDetailsFetched(characterId: characterId),
        ),
      child: BlocBuilder<CharacterDetailsBloc, CharacterDetailsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          switch (state.status) {
            case CharacterDetailsStatus.failure:
              return const Scaffold(
                backgroundColor: Colors.black,
                body: Center(
                    child: Text(
                  'Failed to fetch character details',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
              );
            case CharacterDetailsStatus.success:
              BlocProvider.of<ViewsCounterCubit>(context).increment();

              return CharacterDetailsView(
                characterDetails: state.characterDetails!,
              );
            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
