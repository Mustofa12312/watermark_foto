import 'dart:io';

import 'package:exif/exif.dart';

import 'exif_model.dart';

class ExifService {
  Future<ExifModel?> read(File file) async {
    try {
      final bytes = await file.readAsBytes();
      final data = await readExifFromBytes(bytes);

      final make = data['Image Make']?.printable;
      final model = data['Image Model']?.printable;

      return ExifModel(make: make, model: model);
    } catch (_) {
      return null;
    }
  }
}
