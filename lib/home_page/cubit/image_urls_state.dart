part of 'image_urls_cubit.dart';

sealed class ImageUrlsState extends Equatable {
  const ImageUrlsState(this.images);

  final List<String> images;

  @override
  List<Object> get props => [images];
}

final class ImageUrlsInitial extends ImageUrlsState {
  const ImageUrlsInitial() : super(const []);
}

final class ImageUrlsChanged extends ImageUrlsState {
  const ImageUrlsChanged(super.images);
}
