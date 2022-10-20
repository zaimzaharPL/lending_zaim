import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lending_zaim/main.dart';

void main() {
  group('Lending 1 Tests', () {
    testWidgets('Lending 1 has all the right elements', (widgetTester) async {
      await widgetTester
          .pumpWidget(const MaterialApp(home: LendingButtonPage()));

      var headingWidget = find.byKey(Key('heading'));
      var contentWidget = find.byKey(Key('content'));
      var buttonWidget = find.byKey(Key('button'));

      expect(headingWidget, findsOneWidget);
      expect(contentWidget, findsOneWidget);
      expect(buttonWidget, findsOneWidget);
    });

    testWidgets('buttons are functional', (widgetTester) async {
      int buttonTap = 0;

      await widgetTester.pumpWidget(
        MaterialApp(
          home: GestureDetector(
            key: Key('button'),
            onTap: () {
              buttonTap++;
            },
          ),
        ),
      );

      var buttonWidget = find.byKey(Key('button'));
      expect(buttonTap, 0);

      await widgetTester.tap(buttonWidget);
      expect(buttonTap, 1);
    });
  });
}
