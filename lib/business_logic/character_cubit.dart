import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/data/models/characters.dart';

import '../data/repos/characters_ripo.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharactersRipo charactersRipo;
  late List<Character> characters;
  CharacterCubit(this.charactersRipo) : super(CharacterInitial());

  List<Character> getAllCharacters(){
    charactersRipo.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));// as saying state
      this.characters = characters;
    });

    return characters;
  }
}
