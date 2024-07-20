class UrlImagesModel {
  UrlImagesModel(
    this.urls,
  );

  UrlImagesModel.initial() : urls = [];
  final List<String> urls;

  UrlImagesModel copyWith({
    List<String>? images,
  }) {
    return UrlImagesModel(
      images ?? urls,
    );
  }
}
