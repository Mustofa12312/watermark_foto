import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../picker/picker_screen.dart';
import '../presets/preset_screen.dart';
import '../settings/settings_screen.dart';
import 'navigation_controller.dart';

class NavigationScreen extends ConsumerWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navigationControllerProvider);

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [
          /// TAB 0 — Editor
          /// PickerScreen akan mengurus pilih foto → editor
          PickerScreen(),

          /// TAB 1 — Preset
          PresetScreen(),

          /// TAB 2 — Export
          ExportScreenPlaceholder(),

          /// TAB 3 — Settings
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          ref.read(navigationControllerProvider.notifier).changeTab(index);
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Editor'),
          BottomNavigationBarItem(icon: Icon(Icons.palette), label: 'Preset'),
          BottomNavigationBarItem(icon: Icon(Icons.download), label: 'Export'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

/// Placeholder Export
/// Nanti akan diganti ExportScreen sebenarnya
/// setelah EditorState terhubung
class ExportScreenPlaceholder extends StatelessWidget {
  const ExportScreenPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Export (select photo first)',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
