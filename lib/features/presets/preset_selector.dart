import '../exif/exif_model.dart';
import 'preset_model.dart';
import 'preset_repository.dart';

class PresetSelector {
  final PresetRepository repository;

  PresetSelector(this.repository);

  PresetModel select(ExifModel? exif) {
    final presets = repository.getAll();

    if (exif == null || exif.make == null) {
      return repository.getDefault();
    }

    for (final preset in presets) {
      if (preset.supportedMakes.contains(exif.make)) {
        return preset;
      }
    }

    return repository.getDefault();
  }
}
