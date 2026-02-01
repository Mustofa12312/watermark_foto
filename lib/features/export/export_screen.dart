import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../editor/editor_controller.dart';
import 'export_service.dart';

class ExportScreen extends ConsumerWidget {
  const ExportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editorState = ref.watch(editorControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Export'), centerTitle: true),
      body: editorState == null
          ? const Center(child: Text('No image selected'))
          : Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.image, size: 72),
                  const SizedBox(height: 16),
                  const Text('Ready to export', style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 32),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.download),
                    label: const Text('Save to Gallery'),
                    onPressed: () async {
                      final service = ExportService();

                      try {
                        await service.saveToGallery(editorState.imageFile);

                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Saved to gallery')),
                          );
                        }
                      } catch (_) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Failed to save image'),
                            ),
                          );
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
