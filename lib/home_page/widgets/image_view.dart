import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:tecno_image_view/global_widgets/global_image_network.dart';
import 'package:tecno_image_view/helpers/image_downloader.dart';
import 'package:tecno_image_view/helpers/open_editor.dart';

class ImageView extends StatelessWidget {
  const ImageView({
    this.isHovering = false,
    this.image,
    this.memoryImage,
    super.key,
  });

  final String? image;
  final bool isHovering;
  final Uint8List? memoryImage;

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: FocusNode(),
      onKeyEvent: (event) {
        if (event.logicalKey == LogicalKeyboardKey.exSel) {
          Navigator.of(context).pop();
        }
      },
      child: InstaImageViewer(
        topChild: showImageDetails(context),
        child: memoryImage != null
            ? Image.memory(memoryImage!)
            : GlobalNetworkImage(
                image!,
                fit: isHovering ? BoxFit.contain : BoxFit.cover,
              ),
      ),
    );
  }

  Align showImageDetails(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FilledButton.icon(
            onPressed: () {
              openEditor(context, memoryImage, image!);
            },
            style: OutlinedButton.styleFrom(
              shape: const RoundedRectangleBorder(),
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
            ),
            icon: const Icon(Icons.edit, color: Colors.black),
            label: const Text(
              'Editar imagem',
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(height: 10),
          FilledButton.icon(
            onPressed: _downloadImage,
            style: OutlinedButton.styleFrom(
              shape: const RoundedRectangleBorder(),
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
            ),
            icon: const Icon(Icons.download),
            label: const Text(
              'Baixar imagem',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Future<void> _downloadImage() async {
    unawaited(downloadImage(memoryImage, image));
  }
}
