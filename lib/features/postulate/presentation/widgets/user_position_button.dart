import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sermanos/features/postulate/application/controllers/focused_coordinate_controller.dart';
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

          ref.read(focusedCoordinateControllerProvider.notifier).set(position);
        },
      ),
    );
  }
}
