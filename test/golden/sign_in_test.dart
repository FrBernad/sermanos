import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sermanos/features/auth/presentation/screens/sign_in_screen.dart';

void main() {
  testWidgets('Golden test', (WidgetTester tester) async {
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
            child: SignInScreen(),
          ),
        ),
      ),
    );
    await expectLater(
      find.byType(SignInScreen),
      matchesGoldenFile('./images/signin_screen.png'),
    );
  });
}
