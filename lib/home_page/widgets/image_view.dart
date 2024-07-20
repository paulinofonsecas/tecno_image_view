import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:tecno_image_view/global_widgets/global_image_network.dart';

class ImageView extends StatelessWidget {
  const ImageView({
    required this.image,
    required this.isHovering,
    super.key,
  });

  final String image;
  final bool isHovering;

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
        imageUrl: image,
        child: GlobalNetworkImage(
          image,
          fit: isHovering ? BoxFit.contain : BoxFit.cover,
        ),
      ),
    );
  }
}
