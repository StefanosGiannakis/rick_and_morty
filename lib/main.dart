import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/pages/home_page.dart';

import 'bloc/character_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CharacterBloc>(
          // create: (context) => CharacterBloc()..add(FetchCharacters()),
          create: (context) => CharacterBloc(),
        ),
        // BlocProvider<InteractionsBloc>(
        //   create: (context) => InteractionsBloc(),
        // ),
      ],
      child: MaterialApp(
        title: 'Rick & Morty',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: const HomePage(title: 'Ricky & Morty'),
      ),
    );
  }
}
