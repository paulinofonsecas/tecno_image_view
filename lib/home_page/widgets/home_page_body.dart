// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tecno_image_view/home_page/widgets/add_images/add_images_widget.dart';
import 'package:tecno_image_view/home_page/widgets/images_preview_widget.dart';

/// {@template home_page_body}
/// Body of the HomePagePage.
///
/// Add what it does
/// {@endtemplate}
class HomePageBody extends StatelessWidget {
  /// {@macro home_page_body}
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          AddImagesWidget(),
          ImagesPreviewWidget(),
        ],
      ),
    );
  }
}
