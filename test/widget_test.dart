import 'package:flutter_test/flutter_test.dart';
import 'package:movielog/main.dart';

void main() {
  testWidgets('StartScreen renders title text', (WidgetTester tester) async {
    await tester.pumpWidget(const MovieLogApp());

    expect(find.text('영화의 순간을 기록하세요'), findsOneWidget);
  });
}