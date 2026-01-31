class BackgroundConfig {
  final bool enabled;

  /// warna background dalam HEX
  final int colorHex;

  /// 0.0 – 1.0
  final double opacity;

  final double borderRadius;

  const BackgroundConfig({
    this.enabled = false,
    this.colorHex = 0xFFFFFFFF,
    this.opacity = 1.0,
    this.borderRadius = 0,
  });
}
