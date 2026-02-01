import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../editor/editor_controller.dart'; // ✅ INI YANG KURANG
import '../editor/editor_screen.dart';
import '../export/export_screen.dart';
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
          EditorTab(),

          /// TAB 1 — Preset
          PresetScreen(),

          /// TAB 2 — Export
          ExportScreen(),

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

/// EditorTab memilih Picker atau Editor otomatis
class EditorTab extends ConsumerWidget {
  const EditorTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editorState = ref.watch(editorControllerProvider);

    if (editorState == null) {
      return const PickerScreen();
    }

    return const EditorScreen();
  }
}
