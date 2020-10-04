// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:movie_box/main.dart';
import 'package:movie_box/screens/search_page.dart';
import 'package:image_test_utils/image_test_utils.dart';

void main() {
  Widget makeTestableWidget({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }
  
  group('Search', () {
    testWidgets('Non-empty search, results found', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      provideMockedNetworkImages(() async {
        await tester.pumpWidget( makeTestableWidget(child: SearchPage()));
        var search = find.byKey(Key('searchField'));
        await tester.enterText(search, 'Joker');

        await tester.pump();
        expect(find.byKey(Key('searchResult')), findsOneWidget);

      });

    });

    testWidgets('Empty search, results found', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      provideMockedNetworkImages(() async {
        await tester.pumpWidget( makeTestableWidget(child: SearchPage()));
        var search = find.byKey(Key('searchField'));
        await tester.enterText(search, '');

        await tester.pump();
        expect(find.byKey(Key('searchResult')), findsOneWidget);

      });

    });

    testWidgets('Non-empty Search, results not found', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      provideMockedNetworkImages(() async {
        await tester.pumpWidget( makeTestableWidget(child: SearchPage()));
        var search = find.byKey(Key('searchField'));
        await tester.enterText(search, 'kabsndbdjbd');

        await tester.pump();
        // TODO: Test for- NaN message on failed search
        // await expectLater(find.byType(NaNMessgae), findsOneWidget);

      });

    });
  });
}
