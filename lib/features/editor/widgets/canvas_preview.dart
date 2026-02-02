import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'watermark_painter.dart';

class CanvasPreview extends StatefulWidget {
  final File imageFile;
  final String watermarkText;

  const CanvasPreview({
    super.key,
    required this.imageFile,
    required this.watermarkText,
  });

  @override
  State<CanvasPreview> createState() => _CanvasPreviewState();
}

class _CanvasPreviewState extends State<CanvasPreview> {
  ui.Image? _image;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    final bytes = await widget.imageFile.readAsBytes();
    final codec = await ui.instantiateImageCodec(bytes);
    final frame = await codec.getNextFrame();

    setState(() {
      _image = frame.image;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_image == null) {
      return const CircularProgressIndicator();
    }

    return FittedBox(
      child: CustomPaint(
        size: Size(_image!.width.toDouble(), _image!.height.toDouble()),
        painter: WatermarkPainter(
          image: _image!,
          watermarkText: widget.watermarkText,
        ),
      ),
    );
  }
}
