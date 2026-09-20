import 'package:flutter_test/flutter_test.dart';
import 'package:jay/main.dart';

void main() {
  testWidgets('프로필 화면이 표시된다', (WidgetTester tester) async {
    await tester.pumpWidget(const MovieLogApp());
    expect(find.text('무비러버'), findsOneWidget);
  });
}
