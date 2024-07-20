import 'package:flutter/material.dart';
import 'package:tecno_image_view/home_page/bloc/bloc.dart';
import 'package:tecno_image_view/home_page/widgets/home_page_body.dart';

/// {@template home_page_page}
/// A description for HomePagePage
/// {@endtemplate}
class HomePagePage extends StatelessWidget {
  /// {@macro home_page_page}
  const HomePagePage({super.key});

  /// The static route for HomePagePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const HomePagePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tecno Image Viewer'),
        ),
        body: const HomePageView(),
      ),
    );
  }
}

/// {@template home_page_view}
/// Displays the Body of HomePageView
/// {@endtemplate}
class HomePageView extends StatelessWidget {
  /// {@macro home_page_view}
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePageBody();
  }
}
