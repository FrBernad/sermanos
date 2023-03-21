import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sermanos/features/postulate/presentation/widgets/search_input.dart';

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
          SearchInput(),
          SizedBox(height: 32),
          Expanded(child: PostulateList()),
        ],
      ),
    );
  }
}
