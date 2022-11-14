import 'package:image_search/data/data_source/pixabay_api.dart';
import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/domain/model/photo.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';

class PhotoApiRepositoryImpl extends PhotoApiRepository {
  final PixabayApi api;

  PhotoApiRepositoryImpl({
    required this.api,
  });

  @override
  Future<Result<List<Photo>>> fetch(String query) async {
    final Result<Iterable> result = await api.fetch(query);
    return result.when(
        success: (iterable) {
          return Result.success(
              iterable.map((e) => Photo.fromJson(e)).toList());
        },
        error: (message) {
          return Result.error(message);
        });
  }
}
