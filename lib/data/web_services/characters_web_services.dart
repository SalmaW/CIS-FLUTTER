//for each web service a file, so each file execute specific functionality (modules)
import 'package:dio/dio.dart';
import 'package:untitled/constants/strings.dart';

class CharactersWebServices {
  late Dio dio;

//constructor
  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseurl,
      receiveDataWhenStatusError: true,
      //when the error happening it gives info about it
      connectTimeout: 20 * 1000,
      //20 seconds
      receiveTimeout: 20 * 1000,
    );

    dio = Dio(options);
  }

//invoke web services call, future takes list ,it can take list of Characters(model) too. getAllCharacters() function. async for API call
  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('characters');
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
    ;
  }
}
