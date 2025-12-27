import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_ide/main.dart';

void main() {
  testWidgets('App renders without crashing', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: MobileIdeApp()));

    // Verify 'Mobile IDE' title/text is present upon start
    expect(find.text('Mobile IDE'), findsOneWidget);
  });
}
