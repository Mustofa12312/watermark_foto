import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'editor_state.dart';

final editorControllerProvider =
    StateNotifierProvider.family<EditorController, EditorState, File>(
      (ref, file) => EditorController(file),
    );

class EditorController extends StateNotifier<EditorState> {
  EditorController(File imageFile)
    : super(
        EditorState(
          imageFile: imageFile,
          watermarkText: 'Shot on Watermark Pro',
        ),
      );

  void updateText(String text) {
    state = state.copyWith(watermarkText: text);
  }
}
