import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sermanos/config/design_system/molecules/inputs/sermanos_search_bar.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_grid.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_typography.dart';
import 'package:sermanos/features/core/presentation/widgets/sliver_separator.dart';
import 'package:sermanos/features/postulate/application/controllers/volunteering_search_controller.dart';
import 'package:sermanos/features/postulate/presentation/widgets/postulate/postulate_list.dart';
import 'package:sermanos/features/postulate/presentation/widgets/postulate/user_activity.dart';

class PostulateListView extends ConsumerWidget {
  const PostulateListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ColoredBox(
      color: SermanosColors.secondary10,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                SermanosGrid(
                  child: SermanosSearchBar(
                    onChanged: (value) {
                      ref
                          .read(volunteeringSearchControllerProvider.notifier)
                          .search(searchTerm: value);
                    },
                  ),
                ),
              ],
            ),
          ),
          const SliverSeparator(height: 32),
          const UserActivity(),
          const SliverToBoxAdapter(
            child: SermanosGrid(
              child: Text(
                "Voluntariados",
                style: SermanosTypography.headline01(),
              ),
            ),
          ),
          const SliverSeparator(height: 24),
          const PostulateList()
        ],
      ),
    );
  }
}
