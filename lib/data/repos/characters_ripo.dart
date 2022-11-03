import 'package:untitled/data/models/characters.dart';
import 'package:untitled/data/web_services/characters_web_services.dart';

class CharactersRipo {
  final CharactersWebServices charactersWebServices;

  CharactersRipo(this.charactersWebServices);

  Future<List<Character>> getAllCharacters() async {
    //get the data from the web server to ripo
    final characters = await charactersWebServices.getAllCharacters();
    return characters.map((character) => Character.fromJson(character)).toList();
  }
}
