import 'package:app/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Should show a logo", (tester) async {
    await tester.pumpWidget(MaterialApp(home: Dashboard()));
    final mainImage = find.byType(Image);
    expect(mainImage, findsOne);
  });
  testWidgets(
    "Should display the transfer feature when the Dashboard is opened",
    (tester) async {
      await tester.pumpWidget(MaterialApp(home: Dashboard()));
      final findWid = find.byType(FeatureItem);
      expect(findWid, findsNWidgets(2));
      final transferWidText = find.widgetWithText(FeatureItem, "Transfer");
      final transferWidIcon = find.widgetWithIcon(
        FeatureItem,
        Icons.monetization_on,
      );
      expect(transferWidIcon, findsOne);
      expect(transferWidText, findsOne);
    },
  );
}
