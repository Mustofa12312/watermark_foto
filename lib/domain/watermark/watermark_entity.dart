import 'layout_config.dart';
import 'text_style_config.dart';
import 'background_config.dart';

class WatermarkEntity {
  final String text;

  final LayoutConfig layout;
  final TextStyleConfig textStyle;
  final BackgroundConfig background;

  const WatermarkEntity({
    required this.text,
    required this.layout,
    required this.textStyle,
    required this.background,
  });

  WatermarkEntity copyWith({
    String? text,
    LayoutConfig? layout,
    TextStyleConfig? textStyle,
    BackgroundConfig? background,
  }) {
    return WatermarkEntity(
      text: text ?? this.text,
      layout: layout ?? this.layout,
      textStyle: textStyle ?? this.textStyle,
      background: background ?? this.background,
    );
  }
}
