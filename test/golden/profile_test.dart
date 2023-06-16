import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sermanos/features/user/presentation/screens/profile_screen.dart';

void main() {
  testWidgets('Profile Golden test', (WidgetTester tester) async {
    await tester.pumpWidget(
      Localizations(
        locale: const Locale('en', 'US'),
        delegates: const <LocalizationsDelegate<dynamic>>[
          DefaultWidgetsLocalizations.delegate,
          DefaultMaterialLocalizations.delegate,
        ],
        child: const ProviderScope(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: ProfileScreen(),
          ),
        ),
      ),
    );


    await expectLater(
      find.byType(ProfileScreen),
      matchesGoldenFile('./images/profile_test.png'),
    );
  });
}
