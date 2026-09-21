import 'package:flutter_test/flutter_test.dart';
import 'package:movielog/main.dart';
import 'package:movielog/screens/profile_screen.dart';

void main() {
  testWidgets('start screen renders logo and navigates to profile', (tester) async {
    await tester.pumpWidget(const MovieLogApp());
    await tester.pumpAndSettle();
    expect(find.text('영화의 순간을\n기록하세요'), findsOneWidget);

    await tester.tap(find.text('시작하기'));
    await tester.pumpAndSettle();

    expect(find.byType(ProfileScreen), findsOneWidget);
    expect(find.text('무비러버'), findsOneWidget);
    expect(find.text('본 영화'), findsOneWidget);
    expect(find.text('드라마'), findsOneWidget);
    expect(find.text('프로필 수정'), findsOneWidget);
  });
}
