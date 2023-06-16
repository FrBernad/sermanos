import 'package:sermanos/features/postulate/application/controllers/postulate_view_mode_controller.dart';

class PostulateViewModeControllerMapMock extends PostulateViewModeController {
  @override
  PostulateViewMode build() {
    return PostulateViewMode.map;
  }

  void set(PostulateViewMode mode) {
    state = mode;
  }
}
