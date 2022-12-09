import 'dart:convert';

import 'package:http/http.dart' as http;

class NewsService {
  static Future<Map<String, dynamic>> getData(String category) async {
    Uri uri = Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=3ed7e8b363aa4ad8bd297294f6951451');
    final response = await http.get(uri);
    // response.body is string and i can't deal with String so i use json.decode to convert
    // String into Map, returned data from next line will be Map<String, dynamic>
    return json.decode(response.body);
  }

  static Future<Map<String, dynamic>> search(String value) async {
    Uri url = Uri.parse('https://newsapi.org/v2/everything?q=$value&apiKey=3ed7e8b363aa4ad8bd297294f6951451');
    final response = await http.get(url);
    return json.decode(response.body);
  }

}