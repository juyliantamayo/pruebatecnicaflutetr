import 'package:http/http.dart' as http;

class CharactersService {
  static Future<http.Response> getCharacter(String? next) {
    return next == null
        ? http
            .get(Uri.parse("https://rickandmortyapi.com/api/character/?page=1"))
        : http.get(Uri.parse(next));
  }
}
