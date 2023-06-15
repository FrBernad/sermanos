import 'package:equatable/equatable.dart';
import 'package:sermanos/features/postulate/domain/models/postulation_status.dart';

class VolunteeringReduced extends Equatable {
  final String id;
  final String name;
  final String category;
  final double lat;
  final double lng;
  final PostulationStatus status;

  const VolunteeringReduced({
    required this.id,
    required this.name,
    required this.category,
    required this.lat,
    required this.lng,
    required this.status,
  });

  @override
  List<Object?> get props => [id];
}
