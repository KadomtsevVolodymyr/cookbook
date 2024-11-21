part of 'add_story_cubit.dart';

@freezed
class AddStoryState with _$AddStoryState {
  const factory AddStoryState.initial() = _Initial;
  const factory AddStoryState.loading() = _Loading;
  const factory AddStoryState.loaded({required List<AssetEntity> photos}) =
      _Loaded;
  const factory AddStoryState.permissionDenied() = _PermissionDenied;
}
