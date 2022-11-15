import 'package:flutter_test/flutter_test.dart';
import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';
import 'package:image_search/domain/model/photo.dart';
import 'package:image_search/domain/use_case/get_photos_use_case.dart';
import 'package:image_search/presentation/home/home_view_model.dart';

void main() {
  test('Stream이 잘 동작해야 한다', () async {
    //PixabayApi를 직접 사용하면, PixabayApi를 의존하고 있기 때문에 불완전한 테스트임
    //인터페이스를 사용해서 Fake객체를 넣어줌
    final viewModel = HomeViewModel(
        getPhotosUseCase:
            GetPhotosUseCase(repository: FakephotoApiRepository()));

    await viewModel.fetch('apple');

    final List<Photo> result = fakeJson.map((e) => Photo.fromJson(e)).toList();

    expect(viewModel.state.photos, result);
  });
}

class FakephotoApiRepository extends PhotoApiRepository {
  @override
  Future<Result<List<Photo>>> fetch(String query) async {
    Future.delayed(const Duration(milliseconds: 500));
    return Result.success(fakeJson.map((e) => Photo.fromJson(e)).toList());
  }
}

List<Map<String, dynamic>> fakeJson = [
  {
    "id": 634572,
    "pageURL":
        "https://pixabay.com/photos/apples-fruits-red-ripe-vitamins-634572/",
    "type": "photo",
    "tags": "apples, fruits, red",
    "previewURL":
        "https://cdn.pixabay.com/photo/2015/02/13/00/43/apples-634572_150.jpg",
    "previewWidth": 100,
    "previewHeight": 150,
    "webformatURL":
        "https://pixabay.com/get/g8b4588ba2fb24d3ccf0e47fb68a0d465245b123d9bd7d0469fe598fbcbb117630e8e1730a667665b7aaf77b8bc8d25c2_640.jpg",
    "webformatWidth": 427,
    "webformatHeight": 640,
    "largeImageURL":
        "https://pixabay.com/get/gedd3a2064705cb09893c44c4b1d754c2d82a8abd3a6e48b82d780d374dc286310efcdcc3dfe8296070dc82d909ff95e791bf22309ff27712a2f0de5f89955e22_1280.jpg",
    "imageWidth": 3345,
    "imageHeight": 5017,
    "imageSize": 811238,
    "views": 444105,
    "downloads": 255150,
    "collections": 1237,
    "likes": 2327,
    "comments": 186,
    "user_id": 752536,
    "user": "Desertrose7",
    "userImageURL":
        "https://cdn.pixabay.com/user/2016/03/14/13-25-18-933_250x250.jpg"
  },
  {
    "id": 1868496,
    "pageURL":
        "https://pixabay.com/photos/apple-computer-desk-workspace-1868496/",
    "type": "photo",
    "tags": "apple, computer, desk",
    "previewURL":
        "https://cdn.pixabay.com/photo/2016/11/29/08/41/apple-1868496_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/gf86dd685b431b8f1b53538d9480b894de169882d04c79921fc99c5d851ab26b125e01dcbc7764fd3ba4b9fd85b72c6ae9c51b05764598e680857345daa7f73ee_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL":
        "https://pixabay.com/get/g9dfc4cb23397f10abdcb0440c78efb4dffc850ed9832ad9ac6839fe138ac41fff99ddd49de3598629467cce054241dee743223ede3e87502c682e85466ebb4d5_1280.jpg",
    "imageWidth": 5184,
    "imageHeight": 3456,
    "imageSize": 2735519,
    "views": 635517,
    "downloads": 461607,
    "collections": 1325,
    "likes": 992,
    "comments": 266,
    "user_id": 2286921,
    "user": "Pexels",
    "userImageURL":
        "https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"
  },
];
