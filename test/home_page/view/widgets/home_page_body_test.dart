// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tecno_image_view/home_page/home_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomePageBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => HomePageBloc(),
          child: MaterialApp(home: HomePageBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
