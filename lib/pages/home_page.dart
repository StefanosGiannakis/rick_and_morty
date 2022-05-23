import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/character_bloc.dart';
import 'package:rick_and_morty/bloc/interactions_bloc.dart';

class HomePage extends StatelessWidget {
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
          // // TODO: implement listener

          if (state.isLoading) {
            // isLoading = state.isLoading;
            print('i stoped');
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
      height: 140,
      // padding: const EdgeInsets.symmetric(horizontal: 4.0),
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
                height: 140.0,
                width: 140.0,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 2.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              // @todo wrap texty
              children: <Widget>[
                Text(
                  state.allCharacters[index].id.toString() +
                      ' ' +
                      state.allCharacters[index].name,
                  maxLines: 2,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                  softWrap: true,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: getCharacterStatusColor(state, index),
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
                      state.allCharacters[index].status,
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
              ],
            ),
          ),
        ],
        // ),
      ),
    );
  }

  getCharacterStatusColor(CharacterState state, int index) {
    if (state.allCharacters[index].status == 'Alive') {
      return Colors.green;
    } else if (state.allCharacters[index].status == 'Dead') {
      return Colors.red;
    }

    return const Color(0x00ffffff);
  }
}
