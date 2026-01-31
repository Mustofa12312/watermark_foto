import 'preset_model.dart';

const List<PresetModel> defaultPresets = [
  PresetModel(
    id: 'auto_default',
    name: 'Auto Default',
    category: PresetCategory.auto,
    supportedMakes: [],
    watermarkText: 'Shot on Watermark Pro',
  ),
  PresetModel(
    id: 'apple_minimal',
    name: 'Apple Minimal',
    category: PresetCategory.minimal,
    supportedMakes: ['Apple'],
    watermarkText: 'Shot on iPhone',
  ),
  PresetModel(
    id: 'xiaomi_leica',
    name: 'Leica Inspired',
    category: PresetCategory.editorial,
    supportedMakes: ['Xiaomi'],
    watermarkText: 'Leica Style Shot',
  ),
];
