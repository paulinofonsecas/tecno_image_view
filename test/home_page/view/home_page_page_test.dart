// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tecno_image_view/home_page/home_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomePagePage', () {
    group('route', () {
      test('is routable', () {
        expect(HomePagePage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders HomePageView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: HomePagePage()));
      expect(find.byType(HomePageView), findsOneWidget);
    });
  });
}
