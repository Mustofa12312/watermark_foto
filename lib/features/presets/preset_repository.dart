import 'preset_model.dart';
import 'default_presets.dart';

class PresetRepository {
  List<PresetModel> getAll() {
    return defaultPresets;
  }

  PresetModel getDefault() {
    return defaultPresets.first;
  }
}
