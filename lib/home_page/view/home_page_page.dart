import 'package:flutter/material.dart';
import 'package:tecno_image_view/home_page/bloc/bloc.dart';
import 'package:tecno_image_view/home_page/cubit/image_urls_cubit.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomePageBloc(),
        ),
        BlocProvider(
          create: (context) => ImageUrlsCubit(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Easy Online Image-viewer'),
          centerTitle: true,
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
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 850) {
          return const HomePageBody();
        } else if (constraints.maxWidth >= 850 && constraints.maxWidth < 1200) {
          return const Row(
            children: [
              Spacer(flex: 2),
              Expanded(
                flex: 10,
                child: HomePageBody(),
              ),
              Spacer(flex: 2),
            ],
          );
        } else {
          return const Row(
            children: [
              Spacer(flex: 3),
              Expanded(
                flex: 8,
                child: HomePageBody(),
              ),
              Spacer(flex: 3),
            ],
          );
        }
      },
    );
  }
}
