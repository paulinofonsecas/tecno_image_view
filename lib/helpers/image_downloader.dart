// ignore_for_file: inference_failure_on_function_invocation

import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:download/download.dart';

Future<void> downloadImage(Uint8List? imageBytes, String? imagePath) async {
  late Uint8List? bytes;
  if (imageBytes == null) {
    bytes = await generateImageBytes(imagePath!);
  } else {
    bytes = imageBytes;
  }

  final stream = Stream.fromIterable(bytes!);
  unawaited(download(stream, 'Image 01.png'));
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
