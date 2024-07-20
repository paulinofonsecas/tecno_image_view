import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tecno_image_view/home_page/cubit/image_urls_cubit.dart';
import 'package:tecno_image_view/home_page/home_page.dart';
import 'package:tecno_image_view/home_page/widgets/image_view.dart';

class ImagePreviewItem extends StatefulWidget {
  const ImagePreviewItem({required this.image, super.key});

  final String image;

  @override
  State<ImagePreviewItem> createState() => _ImagePreviewItemState();
}

class _ImagePreviewItemState extends State<ImagePreviewItem> {
  bool isHovering = false;

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
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                isHovering: isHovering,
              ),
              if (isHovering)
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    color: Colors.red,
                    onPressed: () {
                      context
                          .read<ImageUrlsCubit>()
                          .removeImageUrl(widget.image);
                    },
                    icon: const Icon(FontAwesomeIcons.trash, size: 16),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
