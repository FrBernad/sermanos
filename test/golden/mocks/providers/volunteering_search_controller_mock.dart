import 'package:sermanos/features/postulate/application/controllers/volunteering_search_controller.dart';
import 'package:sermanos/features/postulate/domain/models/volunteering.dart';

import '../volunteering_list_mock.dart';


class VolunteeringSearchControllerMock extends VolunteeringSearchController {
  @override
  Future<List<Volunteering>> build() async {
    return volunteeringListMock;
  }
}
