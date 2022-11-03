import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/data/repos/characters_ripo.dart';
import 'package:untitled/presentation/screens/character_detals_screen.dart';
import 'package:untitled/presentation/screens/character_screen.dart';
import 'business_logic/character_cubit.dart';
import 'constants/strings.dart';
import 'data/web_services/characters_web_services.dart';

class AppRouter {
  late CharactersRipo charactersRipo;
  late CharacterCubit charactersCubit;

  AppRouter() {
    charactersRipo = CharactersRipo(CharactersWebServices());
    charactersCubit = CharacterCubit(charactersRipo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case characterScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(//create the cubit
                  create: (BuildContext context) => charactersCubit,
                      // CharacterCubit(charactersRipo),
                  child: CharacterScreen(),
                ));
        break;
      case characterDetailsScreen:
        return MaterialPageRoute(builder: (_) => CharacterDetailsScreen());
        break;
      default:
    }
  }
}
