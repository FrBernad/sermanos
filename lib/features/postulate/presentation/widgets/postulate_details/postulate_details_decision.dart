import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sermanos/features/postulate/application/controllers/current_user_volunteering_controller.dart';
import 'package:sermanos/features/postulate/domain/models/volunteering.dart';
import 'package:sermanos/features/postulate/presentation/widgets/postulate_details/postulate_quit_actual_volunteering.dart';
import 'package:sermanos/features/postulate/presentation/widgets/postulate_details/postulate_volunteering.dart';

import '../../../domain/models/postulation_status.dart';
import 'postulate_quit_postulation.dart';
import 'postulate_quit_volunteering.dart';

class PostulateDetailDecision extends ConsumerWidget {
  const PostulateDetailDecision({
    Key? key,
    required this.volunteering,
  }) : super(key: key);

  final Volunteering volunteering;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userVolunteering =
        ref.watch(currentUserVolunteeringControllerProvider);

    if (userVolunteering == null) {
      return PostulateVolunteering(volunteering: volunteering);
    }

    if (userVolunteering.id == volunteering.id) {
      if (userVolunteering.status == PostulationStatus.pending) {
        return PostulateQuitPostulation(volunteering: volunteering);
      }

      return PostulateQuitVolunteering(volunteering: volunteering);
    }

    return PostulateQuitActualVolunteering(volunteering: volunteering);
  }
}
