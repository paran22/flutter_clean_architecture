import 'dart:async';
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';
import 'package:image_search/domain/model/photo.dart';
import 'package:image_search/presentation/home/home_ui_event.dart';

class HomeViewModel with ChangeNotifier {
  final PhotoApiRepository repository;

  List<Photo> _photos = [];

  UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);

  final _eventController = StreamController<HomeUiEvent>();

  Stream<HomeUiEvent> get eventStream => _eventController.stream;

  HomeViewModel({
    required this.repository,
  });

  Future<void> fetch(String query) async {
    final result = await repository.fetch(query);

    result.when(success: (photos) {
      _photos = photos;
      notifyListeners();
    }, error: (message) {
      _eventController.add(HomeUiEvent.showSnackBar(message));
    });
  }
}
