// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:tecno_image_view/home_page/bloc/bloc.dart';

void main() {
  group('HomePageEvent', () {  
    group('CustomHomePageEvent', () {
      test('supports value equality', () {
        expect(
          CustomHomePageEvent(),
          equals(const CustomHomePageEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomHomePageEvent(),
          isNotNull
        );
      });
    });
  });
}
