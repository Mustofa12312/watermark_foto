import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'editor_controller.dart';
import 'widgets/canvas_preview.dart';
import 'widgets/editor_toolbar.dart';
import 'widgets/text_editor_panel.dart';

class EditorScreen extends ConsumerWidget {
  const EditorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editorControllerProvider);

    // Safety check (harusnya jarang terjadi)
    if (state == null) {
      return const Center(child: Text('No image selected'));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Editor'), centerTitle: true),
      bottomNavigationBar: EditorToolbar(
        onEditText: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) {
              return TextEditorPanel(
                initialText: state.watermarkText,
                onChanged: (text) {
                  ref.read(editorControllerProvider.notifier).updateText(text);
                },
              );
            },
          );
        },
      ),
      body: Center(
        child: CanvasPreview(
          imageFile: state.imageFile,
          watermarkText: state.watermarkText,
        ),
      ),
    );
  }
}
