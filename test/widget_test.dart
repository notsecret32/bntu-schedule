import 'package:bntu_schedule/bntu_schedule_app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const BntuScheduleApp());
    expect(find.text('Страница Расписание'), findsOneWidget);
  });
}
