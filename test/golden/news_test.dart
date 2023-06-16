import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sermanos/features/news/application/controllers/news_search_controller.dart';
import 'package:sermanos/features/news/presentation/screens/news_screen.dart';

import 'news_search_controller_mock.dart';

void main() {
  testWidgets(
    'News Screen Golden Test',
    (WidgetTester tester) async {
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
