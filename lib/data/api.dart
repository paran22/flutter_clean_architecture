import 'package:dio/dio.dart';
import 'package:image_search/model/photo.dart';

class PixabayApi {
  static const key = '30984181-d623bf966cadc3fe98995eb2b';
  static const baseUrl = 'http://pixabay.com/api/';

  Future<List<Photo>> fetch(String query) async {
    final response = await Dio().get(
      baseUrl,
      queryParameters: {
        'key': key,
        'q': query,
        'image_type': 'photo',
      },
    );
    return response.data['hits'].map<Photo>((e) => Photo.fromJson(e)).toList();
  }
}
