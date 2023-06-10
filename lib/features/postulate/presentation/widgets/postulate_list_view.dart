import 'package:flutter/material.dart';
import 'package:sermanos/features/postulate/presentation/widgets/postulate_list.dart';

import '../../../../config/design_system/molecules/inputs/sermanos_search_bar.dart';
import '../../../../config/design_system/tokens/sermanos_colors.dart';
import '../../../../config/design_system/tokens/sermanos_grid.dart';
import '../../../../config/design_system/tokens/sermanos_typography.dart';

class PostulateListView extends StatelessWidget {
  const PostulateListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: SermanosColors.secondary10,
      child: Column(
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
