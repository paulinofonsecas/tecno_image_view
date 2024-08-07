import 'dart:async';

import 'package:download/download.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:tecno_image_view/global_widgets/global_image_network.dart';
import 'package:tecno_image_view/home_page/widgets/images_preview_item.dart';

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
        topChild: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(
              bottom: MediaQuery.sizeOf(context).height * .1,
            ),
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: TextButton.icon(
              icon: const Icon(FontAwesomeIcons.download),
              onPressed: () async {
                late Uint8List? bytes;
                if (memoryImage == null) {
                  bytes = await generateImageBytes(image!);
                } else {
                  bytes = memoryImage;
                }

                final stream = Stream.fromIterable(bytes!);
                unawaited(download(stream, 'Image 01.png'));
              },
              label: const Text('Descarregar imagem'),
            ),
          ),
        ),
        child: memoryImage != null
            ? Image.memory(memoryImage!)
            : GlobalNetworkImage(
                image!,
                fit: isHovering ? BoxFit.contain : BoxFit.cover,
              ),
      ),
    );
  }
}
