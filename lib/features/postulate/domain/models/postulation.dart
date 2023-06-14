import 'package:sermanos/features/postulate/domain/models/postulation_status.dart';

class Postulation {
  final PostulationStatus status;
  final String volunteeringId;
  final String postulationId;
  final String category;
  final String name;
  final double lat;
  final double lng;

  const Postulation({
    required this.status,
    required this.postulationId,
    required this.volunteeringId,
    required this.lat,
    required this.lng,
    required this.name,
    required this.category,
  });
}
