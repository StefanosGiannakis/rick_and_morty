import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/character_bloc.dart';
import 'package:rick_and_morty/bloc/interactions_bloc.dart';
import 'package:rick_and_morty/mixins/description_helpers.dart';
import 'package:rick_and_morty/pages/details_page.dart';
import 'package:rick_and_morty/widgets/common_character_details.dart';

class HomePage extends StatelessWidget with DescriptionHelpers {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: const Color.fromARGB(36, 40, 47, 1),
      body: BlocConsumer<InteractionsBloc, InteractionsState>(
        listener: (context, state) {
          if (state.isLoading) {
            // context.read<InteractionsBloc>().add(StopLoading());
          }
          print('is LOADING' + state.toString());
        },
        builder: (context, state) {
          return BlocBuilder<CharacterBloc, CharacterState>(
            builder: (context, state) {
              print('is ' + (state).toString());
              if (state is CharacterInitial) {
                context.read<CharacterBloc>().add(FetchCharacters());
              }

              if (state.allCharacters.isEmpty ||
                  context.read<InteractionsBloc>().state.isLoading) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [CircularProgressIndicator()],
                  ),
                );
              }

              return ListView.builder(
                  itemCount: state.allCharacters.length,
                  itemBuilder: (context, int index) {
                    if ((index + 1) == state.allCharacters.length &&
                        !context.read<InteractionsBloc>().state.isLoading) {
                      // @todo implement loaders
                      // context.read<InteractionsBloc>().add(StartLoading());
                      // context.read<InteractionsBloc>().add(StopLoading());
                      context
                          .read<CharacterBloc>()
                          .add(FetchCharactersNextPage());

                      //     .add(FetchCharactersNextPage(whenDone: () {
                      //   print('when done #########'+ context.read<InteractionsBloc>().state.isLoading.toString());
                      //   // blocB.add(BlocBEvent())
                      //   // context.read<InteractionsBloc>().add(StopLoading());
                      // }
                      // ));
                    }
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                    character: state.allCharacters[index],
                                  )),
                        );
                        print('tapped');
                      },
                      child: characterCard(state, index),
                    );
                  });
            },
          );
        },
      ),
    );
  }

  Widget characterCard(CharacterState state, int index) {
    return Container(
      height: 160,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(59, 62, 67, 1),
          borderRadius: BorderRadius.circular(16.0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  bottomLeft: Radius.circular(16.0)),
              child: CachedNetworkImage(
                imageUrl: state.allCharacters[index].image,
                height: 160.0,
                width: 160.0,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
              ),
            ),
          ),
          CommonCharacterDetails(character: state.allCharacters[index])
        ],
      ),
    );
  }
}
