import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../exif/exif_service.dart';
import 'auto_watermark.dart';
import 'editor_state.dart';

final editorControllerProvider =
    StateNotifierProvider.family<EditorController, EditorState, File>(
      (ref, file) => EditorController(ref, file),
    );

class EditorController extends StateNotifier<EditorState> {
  final Ref ref;

  EditorController(this.ref, File imageFile)
    : super(EditorState(imageFile: imageFile, watermarkText: 'Loading...')) {
    _loadExifAndSetWatermark();
  }

  /// Load EXIF lalu set watermark otomatis
  Future<void> _loadExifAndSetWatermark() async {
    try {
      final exifService = ExifService();
      final result = await exifService.readExif(state.imageFile);

      final autoText = buildAutoWatermark(result?.make, result?.model);

      state = state.copyWith(watermarkText: autoText);
    } catch (_) {
      // fallback aman
      state = state.copyWith(watermarkText: 'Shot on Camera');
    }
  }

  /// Update watermark manual dari user
  void updateText(String text) {
    state = state.copyWith(watermarkText: text);
  }
}
