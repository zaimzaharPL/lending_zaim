import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lending_zaim/main.dart';

void main() {
    testWidgets('Lending 1 has all the right elements', (widgetTester) async {
      await widgetTester
          .pumpWidget(const MaterialApp(home: LendingButtonPage()));

      var headingWidget = find.byKey(Key('heading'));
      var contentWidget = find.byKey(Key('content'));
      var erButtonWidget = find.byKey(Key('erButton'));

      expect(headingWidget, findsOneWidget);
      expect(contentWidget, findsOneWidget);
      expect(icButtonWidget, findsOneWidget);
      expect(erButtonWidget, findsOneWidget);

      expect(chosenOption, -1.0);
      expect(icButtonActive, true);

      await widgetTester.tap(erButtonWidget);
      expect(chosenOption, 1.0);
      expect(icButtonActive, false);

      await widgetTester.tap(icButtonWidget);
      expect(chosenOption, -1.0);
      expect(icButtonActive, true);
    });
}
