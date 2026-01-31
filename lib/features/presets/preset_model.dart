enum PresetCategory { auto, minimal, film, editorial }

class PresetModel {
  final String id;
  final String name;
  final PresetCategory category;

  /// device make, contoh: Xiaomi, Apple
  final List<String> supportedMakes;

  final String watermarkText;

  const PresetModel({
    required this.id,
    required this.name,
    required this.category,
    required this.supportedMakes,
    required this.watermarkText,
  });
}
