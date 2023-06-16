import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nock/nock.dart';
import 'package:sermanos/features/news/application/controllers/news_search_controller.dart';
import 'package:sermanos/features/news/presentation/screens/news_screen.dart';

import 'news_search_controller_mock.dart';

void main() {
  setUpAll(() {
    nock.init();
  });

  setUp(() {
    nock.cleanAll();
    const MethodChannel('plugins.flutter.io/path_provider')
        .setMethodCallHandler(
      (MethodCall methodCall) async {
        if (methodCall.method == 'getApplicationSupportDirectory') {
          return <String, dynamic>{}; // set initial values here if desired
        } else if (methodCall.method == 'getTemporaryDirectory') {
          return <String, dynamic>{}; // set initial values here if desired
        }

        return null;
      },
    );
  });
  testWidgets(
    'News Screen Golden Test',
    (WidgetTester tester) async {
      nock('').get('').reply(
            200,
            "result",
          );

      await tester.pumpWidget(
        Localizations(
          locale: const Locale('en', 'US'),
          delegates: const <LocalizationsDelegate<dynamic>>[
            DefaultWidgetsLocalizations.delegate,
            DefaultMaterialLocalizations.delegate,
          ],
          child: ProviderScope(
            overrides: [
              // ignore: scoped_providers_should_specify_dependencies
              newsSearchControllerProvider
                  .overrideWith((ref) => newsSearchControllerMock(ref))
            ],
            child: const Directionality(
              textDirection: TextDirection.ltr,
              child: Material(
                child: NewsScreen(),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(NewsScreen),
        matchesGoldenFile('./images/news_screen.png'),
      );
    },
  );
}
