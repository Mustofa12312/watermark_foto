import 'dart:io';

class EditorState {
  final File imageFile;
  final String watermarkText;

  const EditorState({required this.imageFile, required this.watermarkText});

  EditorState copyWith({String? watermarkText}) {
    return EditorState(
      imageFile: imageFile,
      watermarkText: watermarkText ?? this.watermarkText,
    );
  }
}
