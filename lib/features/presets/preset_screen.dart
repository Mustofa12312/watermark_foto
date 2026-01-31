import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'preset_controller.dart';
import 'preset_item_widget.dart';

class PresetScreen extends ConsumerWidget {
  const PresetScreen({super.key});

  static const List<String> presets = [
    'Auto',
    'Minimal',
    'Leica Style',
    'Film',
    'Editorial',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPreset = ref.watch(presetControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Presets'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: presets.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.4,
          ),
          itemBuilder: (context, index) {
            final presetName = presets[index];
            final isSelected = presetName == selectedPreset;

            return PresetItemWidget(
              title: presetName,
              isSelected: isSelected,
              onTap: () {
                ref
                    .read(presetControllerProvider.notifier)
                    .selectPreset(presetName);
              },
            );
          },
        ),
      ),
    );
  }
}
