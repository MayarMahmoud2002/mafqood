import 'dart:io';

import 'package:flutter/services.dart';

Future<Uint8List> imageFileToUint8List(String filePath) async {
  // Read the image file as bytes
  final File imageFile = File(filePath);
  final Uint8List imageBytes = await imageFile.readAsBytes();
  return imageBytes;
}