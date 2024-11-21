import 'package:bloc/bloc.dart';
import 'package:balancebyte/utils/gallery_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_manager/photo_manager.dart';

part 'add_story_state.dart';
part 'add_story_cubit.freezed.dart';

class AddStoryCubit extends Cubit<AddStoryState> {
  AddStoryCubit() : super(const AddStoryState.initial());

  Future<void> loadGallery() async {
    emit(const AddStoryState.loading());
    final permissionState = await GalleryService.requestGalleryPermission();

    if (permissionState.isAuth || permissionState.hasAccess) {
      final photos = await GalleryService.fetchLatestPhotos();
      emit(AddStoryState.loaded(photos: photos));
    } else {
      emit(const AddStoryState.permissionDenied());
    }
  }

  void openSettings() {
    GalleryService.openSettings();
  }
}
