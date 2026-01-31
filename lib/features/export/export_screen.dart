import 'dart:io';

import 'package:flutter/material.dart';

import 'export_service.dart';

class ExportScreen extends StatelessWidget {
  final File imageFile;

  const ExportScreen({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    final service = ExportService();

    return Scaffold(
      appBar: AppBar(title: const Text('Export')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await service.export(original: imageFile);
            if (context.mounted) {
              Navigator.pop(context);
            }
          },
          child: const Text('Save'),
        ),
      ),
    );
  }
}
