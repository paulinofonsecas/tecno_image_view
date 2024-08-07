import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:tecno_image_view/helpers/image_downloader.dart';

Future<Uint8List?> openEditor(
  BuildContext context,
  Uint8List? editedImage,
  String image,
) async {
  final imageBytes = await generateImageBytes(image);

  final images = await Navigator.push(
    // ignore: use_build_context_synchronously
    context,
    // ignore: inference_failure_on_instance_creation
    MaterialPageRoute(
      builder: (context) => ImageEditor(
        image: editedImage ?? imageBytes,
      ),
    ),
  );

  return images as Uint8List?;
}
