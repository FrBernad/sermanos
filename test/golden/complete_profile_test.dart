import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sermanos/features/user/presentation/widgets/complete_profile.dart';

import 'mocks/app_user_mock.dart';

void main() {
  testWidgets(
    'Complete Profile Golden Test',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        Localizations(
          locale: const Locale('en', 'US'),
          delegates: const <LocalizationsDelegate<dynamic>>[
            DefaultWidgetsLocalizations.delegate,
            DefaultMaterialLocalizations.delegate,
          ],
          child: ProviderScope(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: CompleteProfile(user: userMock),
            ),
          ),
        ),
      );
      await expectLater(
        find.byType(CompleteProfile),
        matchesGoldenFile('./images/complete_profile.png'),
      );
    },
  );
}
