import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "https://jsonplaceholder.typicode.com";

class API {
  static Future getUsers() {
    var url = baseUrl + "/users";
    var uri = Uri.http(baseUrl, '/users');
    return http.get(uri);
  }
}

/*import 'package:http/http.dart' as http;

const baseUrl = 'https://api.hgbrasil.com/weather?woeid=455827';

class API {
  static Future getUsers() async {
    var url = baseUrl + '/';
    return await http.get(Uri.parse(baseUrl));
  }
}
*/