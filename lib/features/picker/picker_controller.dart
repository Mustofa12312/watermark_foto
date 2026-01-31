import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'picker_service.dart';

final pickerControllerProvider = StateNotifierProvider<PickerController, File?>(
  (ref) => PickerController(PickerService()),
);

class PickerController extends StateNotifier<File?> {
  final PickerService _service;

  PickerController(this._service) : super(null);

  Future<void> pickImage() async {
    final file = await _service.pickFromGallery();
    if (file != null) {
      state = file;
    }
  }
}
