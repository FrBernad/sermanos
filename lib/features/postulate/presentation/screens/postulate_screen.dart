import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../config/design_system/molecules/inputs/sermanos_search_bar.dart';
import '../widgets/postulate_list.dart';

class PostulateScreen extends ConsumerWidget {
  static const route = "/?tab=postulate";
  static const routeName = "postulate";

  const PostulateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: const [
          SermanosSearchBar(),
          SizedBox(height: 32),
          Expanded(child: PostulateList()),
        ],
      ),
    );
  }
}
