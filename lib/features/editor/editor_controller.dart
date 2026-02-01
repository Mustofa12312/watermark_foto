import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/current_image_provider.dart';
import '../exif/exif_service.dart';
import '../presets/preset_controller.dart';
import 'auto_watermark.dart';
import 'editor_state.dart';

final editorControllerProvider =
    StateNotifierProvider<EditorController, EditorState?>(
      (ref) => EditorController(ref),
    );

class EditorController extends StateNotifier<EditorState?> {
  final Ref ref;

  EditorController(this.ref) : super(null) {
    _init();
  }

  void _init() {
    // listen perubahan foto
    ref.listen<File?>(currentImageProvider, (previous, next) {
      if (next != null) {
        _loadExifAndSetWatermark(next);
      } else {
        state = null;
      }
    });

    // listen perubahan preset
    ref.listen<String?>(presetControllerProvider, (previous, next) {
      if (state == null) return;

      if (next != null) {
        state = state!.copyWith(watermarkText: _presetToText(next));
      }
    });
  }

  Future<void> _loadExifAndSetWatermark(File imageFile) async {
    state = EditorState(imageFile: imageFile, watermarkText: 'Loading...');

    try {
      final exifService = ExifService();
      final result = await exifService.readExif(imageFile);

      final autoText = buildAutoWatermark(result?.make, result?.model);

      state = state!.copyWith(watermarkText: autoText);
    } catch (_) {
      state = state!.copyWith(watermarkText: 'Shot on Camera');
    }
  }

  String _presetToText(String preset) {
    switch (preset) {
      case 'Minimal':
        return 'Shot by Lens Mark';
      case 'Leica Style':
        return 'Leica Inspired Shot';
      case 'Film':
        return 'Film Look Capture';
      case 'Editorial':
        return 'Editorial Frame';
      default:
        return state!.watermarkText;
    }
  }

  void updateText(String text) {
    if (state == null) return;
    state = state!.copyWith(watermarkText: text);
  }
}
