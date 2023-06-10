import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_grid.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_typography.dart';

import '../../../../config/design_system/molecules/inputs/sermanos_search_bar.dart';
import '../../../../config/logger/logger.dart';
import '../widgets/postulate_list.dart';

class PostulateScreen extends ConsumerWidget {
  static const route = "/postulate";
  static const routeName = "postulate";

  const PostulateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: SermanosColors.secondary10,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24),
          SermanosGrid(child: SermanosSearchBar()),
          SizedBox(height: 32),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: SermanosGrid.horizontalSpacing,
            ),
            child: Text(
              "Voluntariados",
              style: SermanosTypography.headline01(),
            ),
          ),
          SizedBox(height: 24),
          PostulateList()
        ],
      ),
    );
  }
}
