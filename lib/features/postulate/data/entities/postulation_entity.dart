import 'package:sermanos/features/postulate/domain/models/postulation.dart';
import 'package:sermanos/features/postulate/domain/models/postulation_status.dart';

class PostulationEntity {
  static const String collectionName = 'postulations';

  final PostulationStatus status;
  final String volunteeringId;
  final String postulationId;
  final String category;
  final String name;
  final double lat;
  final double lng;

  const PostulationEntity({
    required this.status,
    required this.postulationId,
    required this.volunteeringId,
    required this.lat,
    required this.lng,
    required this.name,
    required this.category,
  });

  factory PostulationEntity.fromJson({
    required String postulationId,
    required Map<String, dynamic> json,
  }) {
    PostulationStatus s = PostulationStatus.UNKNOWN;

    if (json['status'] != null) {
      try {
        s = PostulationStatus.getPostulationStatusFromString(json['status']);
      } on StateError {
        s = PostulationStatus.UNKNOWN;
      }
    }

    return PostulationEntity(
      status: s,
      postulationId: postulationId,
      name: json['name'] as String,
      category: json['category'] as String,
      lat: json['lat'] as double,
      lng: json['lng'] as double,
      volunteeringId: json['volunteeringId'],
    );
  }

  Postulation toModel() {
    return Postulation(
      status: status,
      postulationId: postulationId,
      name: name,
      category: category,
      lat: lat,
      lng: lng,
      volunteeringId: volunteeringId,
    );
  }
}
