import 'package:image_picker/image_picker.dart';

class ImagePickerUtil {
  static final ImagePicker _picker = ImagePicker();

  /// Picks an image from the gallery and returns the file path.
  static Future<String?> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image?.path;
  }
}
