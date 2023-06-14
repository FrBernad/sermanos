import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sermanos/features/user/providers.dart';

import '../../domain/models/volunteering_reduced.dart';
import '../../providers.dart';

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
