class TextStyleConfig {
  /// nama font, contoh: Inter, IBM Plex Sans
  final String fontFamily;

  final double fontSize;
  final int fontWeight; // 400, 500, 600
  final double letterSpacing;

  /// warna disimpan sebagai HEX (0xFFFFFFFF)
  final int colorHex;

  const TextStyleConfig({
    required this.fontFamily,
    required this.fontSize,
    required this.fontWeight,
    required this.colorHex,
    this.letterSpacing = 0,
  });
}
