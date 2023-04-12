import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_grid.dart';

import '../../../../config/design_system/molecules/inputs/sermanos_search_bar.dart';
import '../widgets/postulate_list.dart';

class PostulateScreen extends ConsumerWidget {
  static const route = "/postulate";
  static const routeName = "postulate";

  const PostulateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: const [
        SizedBox(height: SermanosGrid.defaultPadding),
        SermanosSearchBar(),
        SizedBox(height: 32),
        Expanded(child: PostulateList()),
        SizedBox(height: SermanosGrid.defaultPadding),
      ],
    );
  }
}
