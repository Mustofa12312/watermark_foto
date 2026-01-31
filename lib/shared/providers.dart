import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/local/preset_local_source.dart';
import '../features/presets/preset_repository.dart';
import '../features/presets/preset_selector.dart';
import '../features/exif/exif_service.dart';

/// DATA SOURCES
final presetLocalSourceProvider = Provider<PresetLocalSource>(
  (ref) => const PresetLocalSource(),
);

/// REPOSITORIES
final presetRepositoryProvider = Provider<PresetRepository>((ref) {
  // saat ini repository masih pakai default preset
  return PresetRepository();
});

/// SERVICES
final exifServiceProvider = Provider<ExifService>((ref) => ExifService());

/// SELECTORS
final presetSelectorProvider = Provider<PresetSelector>((ref) {
  final repository = ref.watch(presetRepositoryProvider);
  return PresetSelector(repository);
});
