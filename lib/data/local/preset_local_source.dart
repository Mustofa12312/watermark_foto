import '../../features/presets/default_presets.dart';
import '../../features/presets/preset_model.dart';

class PresetLocalSource {
  const PresetLocalSource();

  List<PresetModel> loadPresets() {
    return defaultPresets;
  }
}
