import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'image_urls_state.dart';

class ImageUrlsCubit extends Cubit<ImageUrlsState> {
  ImageUrlsCubit() : super(const ImageUrlsInitial());

  void addImagesUrl(String image) {
    emit(ImageUrlsChanged([...state.images, image]));
  }

  void removeImageUrl(String url) {
    emit(ImageUrlsChanged([...state.images]..remove(url)));
  }
}
