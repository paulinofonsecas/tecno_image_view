import 'package:flutter/material.dart';
import 'package:tecno_image_view/home_page/bloc/bloc.dart';
import 'package:tecno_image_view/home_page/widgets/open_photo_button.dart';

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
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        return const Center(child: PickPhotoButton());
      },
    );
  }
}
