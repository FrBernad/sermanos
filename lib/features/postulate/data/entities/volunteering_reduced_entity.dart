import 'package:sermanos/features/postulate/domain/models/postulation_status.dart';

import '../../domain/models/volunteering_reduced.dart';

class VolunteeringReducedEntity {
  static const String collectionName = 'volunteerings';

  final String id;
  final String name;
  final String category;
  final double lat;
  final double lng;
  final PostulationStatus status;

  const VolunteeringReducedEntity({
    required this.id,
    required this.name,
    required this.category,
    required this.lat,
    required this.lng,
    required this.status,
  });

  factory VolunteeringReducedEntity.fromJson({
    required String volunteeringId,
    required Map<String, dynamic> json,
  }) {
    PostulationStatus? s;
    if (json['status'] != null) {
      s = PostulationStatus.getPostulationStatusFromString(json['status']);
    }
    s ??= PostulationStatus.unknown;

    return VolunteeringReducedEntity(
      id: volunteeringId,
      name: json['name'] as String,
      category: json['category'] as String,
      lat: json['lat'] as double,
      lng: json['lng'] as double,
      status: s,
    );
  }

  VolunteeringReduced toModel() {
    return VolunteeringReduced(
      id: id,
      name: name,
      category: category,
      lat: lat,
      lng: lng,
      status: status,
    );
  }
}
