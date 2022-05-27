import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/character_bloc.dart';
import 'package:rick_and_morty/cubit/views_counter_cubit.dart';
import 'package:rick_and_morty/models/character.dart';
import 'package:rick_and_morty/pages/details_page.dart';
import 'package:rick_and_morty/widgets/common_character_details.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<CharacterBloc>().add(CharactersNextPageFetched());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title +
              " - Views: " +
              context.watch<ViewsCounterCubit>().state.counter.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: const Color.fromARGB(36, 40, 47, 1),
      body: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {
          if (state.status == CharacterStatus.failure) {
            return const Center(
                child: Text(
              'Failed to fetch posts',
              style: TextStyle(
                color: Colors.white,
              ),
            ));
          }

          return ListView.builder(
            itemCount: state.hasReachedMax
                ? state.allCharacters.length
                : state.allCharacters.length + 1,
            controller: _scrollController,
            itemBuilder: (BuildContext context, int index) {
              if (index >= state.allCharacters.length) {
                return const Center(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              return CharacterListItem(
                character: state.allCharacters[index],
                onItemClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(
                        characterId: state.allCharacters[index].id,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class CharacterListItem extends StatelessWidget {
  final Character character;
  final VoidCallback onItemClick;
  const CharacterListItem({
    Key? key,
    required this.character,
    required this.onItemClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemClick,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
        child: Material(
          color: const Color.fromRGBO(59, 62, 67, 1),
          elevation: 1.0,
          type: MaterialType.card,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Color.fromRGBO(59, 62, 67, 1),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Image.network(
                    character.image,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 2,
                  child: CommonCharacterDetails(character: character),
                ),
                const SizedBox(
                  width: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
