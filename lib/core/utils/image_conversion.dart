import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

import '../app_export.dart';

class ImageConversion {
  Uint8List? changeToBase64(String? base64Image) {
    Uint8List? bytes;
    try {
      if (base64Image?.isNotEmpty ?? false) {
        bytes = base64Decode(base64Image!);
      }
    } on Exception catch (e) {
      Logger.logError(e);
    }
    return bytes;
  }

  // TODO(himanshu): Fix it.
  Future<File> changeBase64StringImageToFile(String base64Image,
      {String? fileName}) async {
    final Uint8List bytes = base64Decode(base64Image);
    final Directory directory = await getApplicationDocumentsDirectory();
    final File imageFile = File(directory.path);
    imageFile.writeAsBytesSync(bytes);
    Logger.log('imageFile:$imageFile');
    return imageFile;
  }
}
