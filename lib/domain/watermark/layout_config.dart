enum WatermarkPosition { top, bottom, center, custom }

class LayoutConfig {
  final WatermarkPosition position;

  /// padding dalam satuan logical pixel
  final double padding;

  /// jarak antar elemen watermark
  final double spacing;

  const LayoutConfig({
    required this.position,
    this.padding = 16,
    this.spacing = 8,
  });
}
