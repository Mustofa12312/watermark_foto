import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widgets/primary_button.dart';
import '../editor/editor_screen.dart';
import 'picker_controller.dart';

class PickerScreen extends ConsumerWidget {
  const PickerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final File? image = ref.watch(pickerControllerProvider);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: image == null
              ? PrimaryButton(
                  label: 'Choose Photo',
                  onPressed: () async {
                    await ref
                        .read(pickerControllerProvider.notifier)
                        .pickImage();
                  },
                )
              : PrimaryButton(
                  label: 'Edit Photo',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EditorScreen(imageFile: image),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
