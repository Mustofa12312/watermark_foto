import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class WatermarkPainter extends CustomPainter {
  final ui.Image image;
  final String watermarkText;

  WatermarkPainter({required this.image, required this.watermarkText});

  @override
  void paint(Canvas canvas, Size size) {
    // gambar foto
    final paint = Paint();
    canvas.drawImage(image, Offset.zero, paint);

    // text watermark
    final textPainter = TextPainter(
      text: TextSpan(
        text: watermarkText,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w500,
          shadows: [
            Shadow(blurRadius: 6, color: Colors.black, offset: Offset(1, 1)),
          ],
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    // posisi kanan bawah
    final offset = Offset(
      size.width - textPainter.width - 24,
      size.height - textPainter.height - 24,
    );

    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
