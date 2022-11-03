import 'package:flutter/material.dart';
import 'package:untitled/presentation/screens/character_detals_screen.dart';
import 'package:untitled/presentation/screens/character_screen.dart';
import 'constants/strings.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings ){
    switch (settings.name){
      case characterScreen:
        return MaterialPageRoute(builder: (_) => CharacterScreen());
        break;
      case characterDetailsScreen:
        return MaterialPageRoute(builder: (_) => CharacterDetailsScreen());
        break;
      default:
    }
  }
}