import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_search/domain/model/photo.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState(
     List<Photo> photos,
     bool isLoading,
) = _HomeState;




}

