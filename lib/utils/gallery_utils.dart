import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';

class GalleryService {
  /// Requests permission to access the gallery.
  static Future<PermissionState> requestGalleryPermission() async {
    return PhotoManager.requestPermissionExtend();
  }

  /// Fetches the latest photos from the gallery.
  static Future<List<AssetEntity>> fetchLatestPhotos({int count = 15}) async {
    final albums = await PhotoManager.getAssetPathList(
      type: RequestType.image,
    );
    final recentAlbum = albums.first;
    return recentAlbum.getAssetListRange(start: 0, end: count);
  }

  /// Opens app settings for the user to grant permissions.
  static void openSettings() {
    PhotoManager.openSetting();
  }

  static Future<XFile?> pickImageFromGallery() async {
    final picker = ImagePicker();
    return picker.pickImage(source: ImageSource.gallery);
  }
}
