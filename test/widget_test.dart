import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/main.dart'; // Replace with your actual main.dart import path

void main() {
  testWidgets('Calculator app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(CalculatorApp());

    // Verify that our calculator app has a button with text '7'.
    expect(find.text('7'), findsOneWidget);
    
    // Example test: Tap the '7' button and verify the output.
    await tester.tap(find.text('7'));
    await tester.pump();

    expect(find.text('7'), findsOneWidget); // Adjust based on your expected behavior
  });
}
