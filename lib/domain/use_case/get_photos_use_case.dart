import 'dart:math';

import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/domain/model/photo.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';

class GetPhotosUseCase {
  final PhotoApiRepository repository;

  const GetPhotosUseCase({
    required this.repository,
  });

  //일반적으로 인터페이스 사용
  //call은 생략이 가능
  Future<Result<List<Photo>>> call(String query) async {
    final result = await repository.fetch(query);
    return result.when(success: (photos) {
      return Result.success(photos.sublist(0, min(3, photos.length)));
    }, error: (message) {
      return Result.error(message);
    });
  }
}
