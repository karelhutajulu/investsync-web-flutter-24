import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class Utils {
  /// Compresses an image either from a file or from assets.
  static Future<Uint8List?> compressImage(String imagePath, {int quality = 75, int minWidth = 400, int minHeight = 400}) async {
    try {
      Uint8List? data;
      if (imagePath.startsWith('assets/')) {
        // Load asset bytes
        final bd = await rootBundle.load(imagePath);
        final bytes = bd.buffer.asUint8List();
        // Compress in memory
        data = await FlutterImageCompress.compressWithList(
          bytes,
          quality: quality,
          minWidth: minWidth,
          minHeight: minHeight,
        );
      } else {
        // Compress file on disk
        data = await FlutterImageCompress.compressWithFile(
          imagePath,
          quality: quality,
          minWidth: minWidth,
          minHeight: minHeight,
        );
      }
      return data;
    } catch (_) {
      // Handle error, return null if failed
      return null;
    }
  }
}