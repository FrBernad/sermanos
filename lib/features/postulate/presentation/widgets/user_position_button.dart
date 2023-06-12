import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sermanos/features/postulate/application/controllers/current_volunteering_lat_lng_controller.dart';
import 'package:sermanos/features/postulate/application/controllers/user_position_controller.dart';

import '../../../../config/design_system/atoms/icons/sermanos_icons.dart';
import '../../../../config/design_system/molecules/buttons/sermanos_floating_button.dart';
import '../../../../config/design_system/tokens/sermanos_grid.dart';

class UserPositionButton extends ConsumerWidget {
  const UserPositionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SermanosGrid(
      child: SermanosFloatingActionButton(
        icon: SermanosIcons.nearMeFilled(
          status: SermanosIconStatus.activated,
        ),
        onPressed: () async {
          final position =
              await ref.refresh(userPositionControllerProvider.future);
          ref.watch(currentVolunteeringLatLngControllerProvider.notifier).set(
                LatLng(
                  position.latitude,
                  position.longitude,
                ),
              );
        },
      ),
    );
  }
}
