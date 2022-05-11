import 'package:http/http.dart' as http;

class DataServices {
  String baseUrl = "https://api.github.com/";

  getInfo() {
    var apiUrl = '/setplaces';
    return http.get(Uri.parse(baseUrl + apiUrl));
  }
}
