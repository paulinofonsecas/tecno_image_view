import 'package:flutter_test/flutter_test.dart';
import 'package:tecno_image_view/app/view/app.dart';
import 'package:tecno_image_view/home_page/widgets/home_page_body.dart';
import 'package:tecno_image_view/home_page/widgets/open_photo_button.dart';

void main() {
  testWidgets('home page body ...', (tester) async {
    await tester.pumpWidget(const App());

    expect(find.byType(HomePageBody), findsOneWidget);

    expect(find.byType(PickPhotoButton), findsOneWidget);
  });
}
