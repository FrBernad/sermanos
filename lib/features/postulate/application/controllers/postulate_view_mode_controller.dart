import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/postulate_view_mode_controller.g.dart';

enum PostulateViewMode {
  list,
  map,
}

@Riverpod(keepAlive: true)
class PostulateViewModeController extends _$PostulateViewModeController {
  @override
  PostulateViewMode build() {
    return PostulateViewMode.list;
  }

  void set(PostulateViewMode mode) {
    state = mode;
  }
}
