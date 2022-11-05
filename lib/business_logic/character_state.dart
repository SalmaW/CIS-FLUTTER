part of 'character_cubit.dart';

@immutable
abstract class CharacterState {}

class CharacterInitial extends CharacterState {}

// class CharactersErrorCase extends CharacterState {}

class CharactersLoaded extends CharacterState {
  final List<Character> character;

  CharactersLoaded(this.character);

}

class CharQuotesLoaded extends CharacterState {
  final List<CharQuotes> quotes;

  CharQuotesLoaded(this.quotes);

}
