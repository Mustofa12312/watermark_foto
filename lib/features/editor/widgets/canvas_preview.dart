import 'dart:io';

import 'package:flutter/material.dart';

class CanvasPreview extends StatelessWidget {
  final File imageFile;
  final String watermarkText;

  const CanvasPreview({
    super.key,
    required this.imageFile,
    required this.watermarkText,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Image.file(imageFile, fit: BoxFit.contain)),
        Positioned(
          bottom: 16,
          left: 16,
          child: Text(
            watermarkText,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ],
    );
  }
}
