import 'package:flutter/material.dart';

class EditorToolbar extends StatelessWidget {
  final VoidCallback onEditText;

  const EditorToolbar({super.key, required this.onEditText});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 56,
      child: IconButton(
        icon: const Icon(Icons.text_fields),
        onPressed: onEditText,
      ),
    );
  }
}
