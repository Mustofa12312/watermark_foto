import 'dart:io';

import 'package:path_provider/path_provider.dart';

class ExportService {
  Future<File> saveToGallery(File sourceFile) async {
    final directory = await getExternalStorageDirectory();

    if (directory == null) {
      throw Exception('Storage not available');
    }

    final exportDir = Directory('${directory.path}/Pictures/LensMark');

    if (!await exportDir.exists()) {
      await exportDir.create(recursive: true);
    }

    final fileName = 'lens_mark_${DateTime.now().millisecondsSinceEpoch}.jpg';

    final savedFile = await sourceFile.copy('${exportDir.path}/$fileName');

    return savedFile;
  }
}
