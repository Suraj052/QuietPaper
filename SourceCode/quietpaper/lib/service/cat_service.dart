import 'dart:convert';
import 'package:quietpaper/model/cat_model.dart';
import 'package:http/http.dart' as http;

class ApiService
{

  Future<List<CatModel>> getRepo() async
  {
    const url = "https://api.thecatapi.com/v1/images/search";
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if(response.statusCode == 200)
      {
        final json = jsonDecode(response.body) as List;
        final data = json.map((e) {
          return CatModel(
              id: e['id'],
              url: e['url'],
              width: e['width'],
              height: e['height'],
          );
        }).toList();
        return data;
      }
    return [];

  }

}