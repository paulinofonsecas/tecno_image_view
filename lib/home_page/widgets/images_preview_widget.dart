// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecno_image_view/home_page/cubit/image_urls_cubit.dart';
import 'package:tecno_image_view/home_page/widgets/images_preview_item.dart';

class ImagesPreviewWidget extends StatefulWidget {
  const ImagesPreviewWidget({super.key});

  @override
  State<ImagesPreviewWidget> createState() => _ImagesPreviewWidgetState();
}

class _ImagesPreviewWidgetState extends State<ImagesPreviewWidget> {
  @override
  void initState() {
    final uri = Uri.parse(html.window.location.href);
    final params = uri.queryParameters;
    final url = params['url'];

    if (url != null) {
      context.read<ImageUrlsCubit>().addImagesUrl(url);
    }

    super.initState();
  }

  int _kCrossAxisCount(double width) {
    if (width < 600) {
      return 1;
    } else if (width < 800) {
      return 3;
    } else if (width >= 800 && width < 1200) {
      return 4;
    } else {
      return 5;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageUrlsCubit, ImageUrlsState>(
      builder: (context, state) {
        final images = state.images.reversed.toList();

        return LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: EdgeInsets.only(
                left: constraints.maxWidth * .1,
                right: constraints.maxWidth * .1,
                bottom: constraints.maxWidth * .05,
              ),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _kCrossAxisCount(constraints.maxWidth),
                  childAspectRatio: 2 / 2.2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: state.images.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final image = images[index];
                  return ImagePreviewItem(image: image);
                },
              ),
            );
          },
        );
      },
    );
  }
}
