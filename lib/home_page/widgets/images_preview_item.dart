// ignore_for_file: use_build_context_synchronously, inference_failure_on_instance_creation

import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:tecno_image_view/helpers/image_downloader.dart';
import 'package:tecno_image_view/home_page/widgets/image_view.dart';

class ImagePreviewItem extends StatefulWidget {
  const ImagePreviewItem({required this.image, super.key});

  final String image;

  @override
  State<ImagePreviewItem> createState() => _ImagePreviewItemState();
}

class _ImagePreviewItemState extends State<ImagePreviewItem> {
  bool isHovering = false;
  Uint8List? _editedImage;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          isHovering = true;
        });
      },
      onExit: (value) {
        setState(() {
          isHovering = false;
        });
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            border: isHovering
                ? Border.all(
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Theme.of(context).colorScheme.primary,
                    width: 5,
                  )
                : null,
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              ImageView(
                image: widget.image,
                memoryImage: _editedImage,
              ),
              if (isHovering) _showImageDetails(context),
            ],
          ),
        ),
      ),
    );
  }

  Align _showImageDetails(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FilledButton.icon(
            onPressed: _openEditor,
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

  Future<void> _openEditor() async {
    final imageBytes = await generateImageBytes(widget.image);

    final images = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageEditor(
          image: _editedImage ?? imageBytes,
        ),
      ),
    );

    if (images != null) {
      setState(() {
        _editedImage = images as Uint8List;
      });
    }
  }

  Future<void> _downloadImage() async {
    unawaited(downloadImage(_editedImage, widget.image));
  }
}
