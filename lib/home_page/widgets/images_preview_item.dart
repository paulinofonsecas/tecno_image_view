// ignore_for_file: use_build_context_synchronously, inference_failure_on_instance_creation

import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:tecno_image_view/helpers/image_downloader.dart';
import 'package:tecno_image_view/helpers/open_editor.dart';
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
            color: Theme.of(context).colorScheme.primaryContainer,
            border: isHovering
                ? Border.all(
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Theme.of(context).colorScheme.primary,
                    width: 5,
                  )
                : null,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
              ),
            ],
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              ImageView(
                image: widget.image,
                memoryImage: _editedImage,
              ),
              if (isHovering) showImageDetails(context),
            ],
          ),
        ),
      ),
    );
  }

  Align showImageDetails(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return constraints.maxWidth > 800
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _botoesPequenos(context),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: _botoesGrandes(context),
                );
        },
      ),
    );
  }

  Future<void> _downloadImage() async {
    unawaited(downloadImage(_editedImage, widget.image));
  }

  List<Widget> _botoesPequenos(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          openEditor(context, _editedImage, widget.image);
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
      ),
      const SizedBox(height: 10),
      IconButton(
        onPressed: _downloadImage,
        style: OutlinedButton.styleFrom(
          shape: const RoundedRectangleBorder(),
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
        ),
        icon: const Icon(Icons.download),
      ),
      const SizedBox(height: 20),
    ];
  }

  List<Widget> _botoesGrandes(BuildContext context) {
    return [
      FilledButton.icon(
        onPressed: () {
          openEditor(context, _editedImage, widget.image);
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
    ];
  }
}
