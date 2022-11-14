import 'dart:convert';

import 'package:image_search/data/photo_api_repository.dart';
import 'package:image_search/model/photo.dart';
import 'package:http/http.dart' as http;

class PixabayApi extends PhotoApiRepository {
  static const key = '30984181-d623bf966cadc3fe98995eb2b';
  static const baseUrl = 'http://pixabay.com/api/';

  @override
  Future<List<Photo>> fetch(String query, {http.Client? client}) async {
    client ??= http.Client();
    final response = await client
        .get(Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo'));

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}
