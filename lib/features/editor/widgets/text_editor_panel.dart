import 'package:flutter/material.dart';

class TextEditorPanel extends StatelessWidget {
  final String initialText;
  final ValueChanged<String> onChanged;

  const TextEditorPanel({
    super.key,
    required this.initialText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        autofocus: true,
        decoration: const InputDecoration(labelText: 'Watermark Text'),
        controller: TextEditingController(text: initialText),
        onChanged: onChanged,
      ),
    );
  }
}
