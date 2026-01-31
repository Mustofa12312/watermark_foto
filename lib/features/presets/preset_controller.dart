import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider untuk preset yang sedang dipilih
final presetControllerProvider =
    StateNotifierProvider<PresetController, String>(
      (ref) => PresetController(),
    );

class PresetController extends StateNotifier<String> {
  PresetController() : super('Auto');

  void selectPreset(String presetName) {
    state = presetName;
  }
}
