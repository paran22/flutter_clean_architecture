import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';
part 'photo.g.dart';

@freezed
class Photo with _$Photo{
  const factory Photo({
    required int id,
    required String pageURL,
    required String type,
    required String tags,
    required String previewURL,
    required int previewWidth,
    required int previewHeight,
    required String webformatURL,
    required int webformatWidth,
    required int webformatHeight,
    required String largeImageURL,
    required int imageWidth,
    required int imageHeight,
    required int imageSize,
    required int views,
    required int downloads,
    required int collections,
    required int likes,
    required int comments,
    @JsonKey(name: 'user_id') required int userId,
    required String user,
    required String userImageURL,
}) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);


  // 강의에서는 테스트코드에서 equals가 false여서 오버라이드했는데, 아마 현재 test equals는 값 비교로 잘 동작하는 것 같음
  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     other is Photo && runtimeType == other.runtimeType && id == other.id;
  //
  // @override
  // int get hashCode => id.hashCode;
  //
  // @override
  // String toString() {
  //   return 'Photo{id: $id}';
  // }
}