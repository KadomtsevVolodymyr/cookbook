import 'dart:io';

import 'package:camera/camera.dart';
import 'package:image/image.dart' as img;

class ImageUtils {
  static Future<XFile> flipCapturedPhoto(XFile originalPhoto) async {
    final originalImage =
        img.decodeImage(await File(originalPhoto.path).readAsBytes());
    if (originalImage == null) throw Exception("Failed to decode image");

    final flippedImage = img.flipHorizontal(originalImage);

    final flippedFile = await File(originalPhoto.path)
        .writeAsBytes(img.encodeJpg(flippedImage));

    return XFile(flippedFile.path);
  }
}
