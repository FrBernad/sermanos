import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sermanos/features/postulate/application/controllers/postulate_view_mode_controller.dart';
import 'package:sermanos/features/postulate/presentation/widgets/postulate/postulate_list_view.dart';

import '../widgets/postulate/postulate_map_view.dart';

class PostulateScreen extends ConsumerWidget {
  static const route = "/postulate";
  static const routeName = "postulate";

  const PostulateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewMode = ref.watch(postulateViewModeControllerProvider);

    return viewMode == PostulateViewMode.list
        ? const PostulateListView()
        : const PostulateMapView();
  }
}
