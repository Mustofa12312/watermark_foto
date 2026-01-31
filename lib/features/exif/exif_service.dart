import 'dart:io';
import 'package:exif/exif.dart';

class ExifResult {
  final String? make;
  final String? model;

  const ExifResult({this.make, this.model});
}

class ExifService {
  Future<ExifResult?> readExif(File file) async {
    try {
      final bytes = await file.readAsBytes();
      final data = await readExifFromBytes(bytes);

      final make = data['Image Make']?.printable;
      final model = data['Image Model']?.printable;

      return ExifResult(make: make?.trim(), model: model?.trim());
    } catch (_) {
      return null;
    }
  }
}
