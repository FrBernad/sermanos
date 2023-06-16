import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sermanos/features/postulate/application/controllers/postulate_view_mode_controller.dart';
import 'package:sermanos/features/postulate/application/controllers/volunteering_search_controller.dart';
import 'package:sermanos/features/postulate/presentation/screens/postulate_screen.dart';

import 'mocks/providers/postulate_view_mode_controller_list_mock.dart';
import 'mocks/providers/volunteering_search_controller_mock.dart';

void main() {
  testWidgets(
    'Postulate List Golden Test',
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
              volunteeringSearchControllerProvider
                  .overrideWith(() => VolunteeringSearchControllerMock()),
              // ignore: scoped_providers_should_specify_dependencies
              postulateViewModeControllerProvider
                  .overrideWith(() => PostulateViewModeControllerListMock())
            ],
            child: const Directionality(
              textDirection: TextDirection.ltr,
              child: Material(child: PostulateScreen()),
            ),
          ),
        ),
      );
      await expectLater(
        find.byType(PostulateScreen),
        matchesGoldenFile('./images/postulate_list_view.png'),
      );
    },
  );
}
