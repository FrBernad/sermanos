import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sermanos/features/postulate/application/controllers/volunteering_search_controller.dart';

import '../../../../../config/design_system/cellules/cards/sermanos_volunteering_card.dart';
import '../../../../../config/design_system/cellules/cards/sermanos_volunteering_card_loading_skeleton.dart';
import '../../../../../config/design_system/tokens/sermanos_grid.dart';
import '../../../../core/presentation/widgets/error_message.dart';
import 'no_volunteering_available.dart';

class PostulateList extends ConsumerWidget {
  const PostulateList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final volunteeringController =
        ref.watch(volunteeringSearchControllerProvider);

    return volunteeringController.when(
      data: (volunteering) {
        if (volunteering.isEmpty) {
          return const NoVolunteeringAvailable();
        } else {
          return SliverPadding(
            padding: const EdgeInsets.fromLTRB(
              SermanosGrid.horizontalSpacing,
              0,
              SermanosGrid.horizontalSpacing,
              32,
            ),
            sliver: SliverList.separated(
              itemCount: volunteering.length,
              itemBuilder: (context, index) => SermanosVolunteeringCard(
                volunteering: volunteering[index],
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 24,
              ),
            ),
          );
        }
      },
      loading: () => SliverPadding(
        padding: const EdgeInsets.fromLTRB(
          SermanosGrid.horizontalSpacing,
          0,
          SermanosGrid.horizontalSpacing,
          32,
        ),
        sliver: SliverList.separated(
          itemCount: 10,
          itemBuilder: (context, index) =>
              const SermanosVolunteeringCardLoadingSkeleton(),
          separatorBuilder: (context, index) => const SizedBox(
            height: 24,
          ),
        ),
      ),
      error: (error, stackTrace) =>
          const Align(alignment: Alignment.topCenter, child: ErrorMessage()),
    );
  }
}
