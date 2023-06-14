import '../../domain/models/volunteering_reduced.dart';

class VolunteeringReducedEntity {
  static const String collectionName = 'volunteerings';

  final String id;
  final String name;
  final String category;
  final double lat;
  final double lng;

  const VolunteeringReducedEntity({
    required this.id,
    required this.name,
    required this.category,
    required this.lat,
    required this.lng,
  });

  factory VolunteeringReducedEntity.fromJson({
    required String volunteeringId,
    required Map<String, dynamic> json,
  }) {
    return VolunteeringReducedEntity(
      id: volunteeringId,
      name: json['name'] as String,
      category: json['category'] as String,
      lat: json['lat'] as double,
      lng: json['lng'] as double,
    );
  }

  VolunteeringReduced toModel() {
    return VolunteeringReduced(
      id: id,
      name: name,
      category: category,
      lat: lat,
      lng: lng,
    );
  }
}
