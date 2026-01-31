import 'dart:io';

import 'package:image_picker/image_picker.dart';

class PickerService {
  final ImagePicker _picker = ImagePicker();

  Future<File?> pickFromGallery() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);

    if (file == null) return null;
    return File(file.path);
  }
}
