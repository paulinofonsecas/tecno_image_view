// ignore_for_file: use_build_context_synchronously, inference_failure_on_instance_creation

import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
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
              if (isHovering)
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    color: Colors.red,
                    onPressed: () async {
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
                    },
                    icon: const Icon(FontAwesomeIcons.penToSquare, size: 16),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<Uint8List?> generateImageBytes(String image) async {
  final dio = Dio();

  final response = await dio.get(
    image,
    options: Options(
      responseType: ResponseType.bytes,
    ),
  );

  return response.data as Uint8List?;
}
