import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/volunteering_reduced.dart';

part 'generated/current_user_volunteering_controller.g.dart';

@Riverpod(keepAlive: true)
class CurrentUserVolunteeringController
    extends _$CurrentUserVolunteeringController {
  @override
  VolunteeringReduced? build() {
    return null;
  }

  void set(VolunteeringReduced? volunteering) {
    state = volunteering;
  }
}
