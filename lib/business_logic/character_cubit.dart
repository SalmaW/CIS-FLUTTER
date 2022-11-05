import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/data/models/characters.dart';
import 'package:untitled/data/models/quotes.dart';

import '../data/repos/characters_ripo.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharactersRipo charactersRipo;
  List<Character> characters = [];
  CharacterCubit(this.charactersRipo) : super(CharacterInitial());

  List<Character> getAllCharacters(){
    charactersRipo.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));// as saying state
      this.characters = characters;
    });

    return characters;
  }

  void getQuotes(String charName){
    charactersRipo.getCharQuotes(charName).then((quotes) {
      emit(CharQuotesLoaded(quotes));// as saying state
    });
  }
}
