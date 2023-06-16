import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sermanos/features/user/domain/models/app_user_model.dart';
import 'package:sermanos/features/user/presentation/screens/form_modal_screen.dart';

import 'mocks/app_user_mock.dart';

void main() {
  testWidgets(
    'Profile Form Modal Screen Golden Test',
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
              child: ProfileFormModalScreen(
                user: userMock,
              ),
            ),
          ),
        ),
      );
      await expectLater(
        find.byType(ProfileFormModalScreen),
        matchesGoldenFile('./images/profile_form_modal_screen.png'),
      );
    },
  );
}
