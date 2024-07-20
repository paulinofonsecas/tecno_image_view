import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GlobalNetworkImage extends StatelessWidget {
  const GlobalNetworkImage(
    this.url, {
    super.key,
    this.fit,
    this.width,
    this.height,
  });

  final String url;
  final BoxFit? fit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      width: width,
      height: height,
      progressIndicatorBuilder: (context, url, progress) => Center(
        child: CircularProgressIndicator(
          value: progress.progress,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      errorListener: (value) {
        showBottomSheet(
          context: context,
          builder: (value) => const Text('Erro ao carregar imagem'),
        );
      },
    );
  }
}
