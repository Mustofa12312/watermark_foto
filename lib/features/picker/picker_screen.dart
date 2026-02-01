import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widgets/primary_button.dart';
import '../../shared/current_image_provider.dart';
import 'picker_controller.dart';

class PickerScreen extends ConsumerWidget {
  const PickerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final File? pickedImage = ref.watch(pickerControllerProvider);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: PrimaryButton(
            label: pickedImage == null ? 'Choose Photo' : 'Change Photo',
            onPressed: () async {
              await ref.read(pickerControllerProvider.notifier).pickImage();

              final file = ref.read(pickerControllerProvider);

              if (file != null) {
                // 🔑 SIMPAN KE GLOBAL STATE
                ref.read(currentImageProvider.notifier).state = file;

                // Optional UX feedback
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Photo selected')));
              }
            },
          ),
        ),
      ),
    );
  }
}
