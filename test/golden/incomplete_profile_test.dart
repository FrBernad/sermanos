import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sermanos/features/user/domain/models/app_user_model.dart';
import 'package:sermanos/features/user/presentation/widgets/incomplete_profile.dart';

import 'mocks/app_user_mock.dart';

void main() {
  testWidgets(
    'Incomplete Profile Golden Test',
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
              child: IncompleteProfile(
                user: userMock,
              ),
            ),
          ),
        ),
      );
      await expectLater(
        find.byType(IncompleteProfile),
        matchesGoldenFile('./images/incomplete_profile.png'),
      );
    },
  );
}
