import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nock/nock.dart';
import 'package:sermanos/features/postulate/application/controllers/get_volunteering_by_id_controller.dart';
import 'package:sermanos/features/postulate/presentation/screens/postulate_detail_screen.dart';

import '../../.fvm/flutter_sdk/packages/flutter/lib/src/services/platform_channel.dart';
import 'mocks/providers/get_volunteering_by_id_controller_mock.dart';
import 'mocks/volunteering_id_mock.dart';

void main() {
  testWidgets(
    'Postulate Details Golden Test',
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
              getVolunteeringByIdControllerProvider(
                      volunteeringId: volunteeringIdMock)
                  .overrideWith(
                (ref) => getVolunteeringByIdControllerMock(ref,
                    volunteeringId: volunteeringIdMock),
              )
            ],
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: PostulateDetailScreen(
                volunteeringId: volunteeringIdMock,
              ),
            ),
          ),
        ),
      );
      await expectLater(
        find.byType(PostulateDetailScreen),
        matchesGoldenFile('./images/postulate_details.png'),
      );
    },
  );
}
