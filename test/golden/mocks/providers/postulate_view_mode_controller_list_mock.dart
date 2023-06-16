import 'package:sermanos/features/postulate/application/controllers/postulate_view_mode_controller.dart';

class PostulateViewModeControllerListMock extends PostulateViewModeController {
  @override
  PostulateViewMode build() {
    return PostulateViewMode.list;
  }

  void set(PostulateViewMode mode) {
    state = mode;
  }
}
