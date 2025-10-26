import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_painter/image_painter.dart';

class DrawingScreen extends StatefulWidget {
  final String imagePath;

  const DrawingScreen({super.key, required this.imagePath});

  @override
  State<DrawingScreen> createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
  final _imageKey = GlobalKey<ImagePainterState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draw something cool!'),
      ),
      body: ImagePainter.file(
        File(widget.imagePath),
        key: _imageKey,
        scalable: true,
        initialStrokeWidth: 4,
        initialColor: Colors.green,
        initialPaintMode: PaintMode.freeStyle,
      ),
    );
  }
}
