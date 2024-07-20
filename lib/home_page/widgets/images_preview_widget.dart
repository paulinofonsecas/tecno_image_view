import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecno_image_view/home_page/cubit/image_urls_cubit.dart';
import 'package:tecno_image_view/home_page/widgets/images_preview_item.dart';

class ImagesPreviewWidget extends StatelessWidget {
  const ImagesPreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<ImageUrlsCubit, ImageUrlsState>(
        builder: (context, state) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: state.images.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final image = state.images[index];
              return ImagePreviewItem(image: image);
            },
          );
        },
      ),
    );
  }
}
