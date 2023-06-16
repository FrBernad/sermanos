import 'package:sermanos/features/postulate/application/controllers/get_volunteering_by_id_controller.dart';
import 'package:sermanos/features/postulate/domain/models/volunteering.dart';

Future<Volunteering> getVolunteeringByIdControllerMock(
  GetVolunteeringByIdControllerRef ref, {
  required String volunteeringId,
}) async {
  return const Volunteering(
    id: '1',
    name: 'Prueba',
    category: 'Prueba',
    description: 'Prueba',
    about: 'Prueba',
    address: 'Prueba',
    requirements: ['Prueba', 'Prueba'],
    availability: ['Prueba', 'Prueba', 'Prueba'],
    lat: 0.0,
    lng: 0.0,
    imageUrl: '',
    capacity: 10,
    volunteersQty: 10,
  );
}
