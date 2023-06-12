import '../../domain/models/volunteering.dart';

class VolunteeringEntity {
  final String id;
  final String name;
  final String category;
  final String description;
  final String schedule;
  final String address;
  final double lat;
  final double lng;
  final String imageUrl;
  final int capacity;
  final int volunteersQty;

  const VolunteeringEntity({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.schedule,
    required this.address,
    required this.lat,
    required this.lng,
    required this.imageUrl,
    required this.capacity,
    required this.volunteersQty,
  });

  factory VolunteeringEntity.fromJson({
    required String volunteeringId,
    required Map<String, dynamic> json,
  }) {
    return VolunteeringEntity(
      id: volunteeringId,
      name: json['name'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
      schedule: json['schedule'] as String,
      address: json['address'] as String,
      lat: json['lat'] as double,
      lng: json['lng'] as double,
      volunteersQty: json['volunteersQty'] as int,
      capacity: json['capacity'] as int,
      imageUrl: json['imageUrl'] as String,
    );
  }

  Volunteering toModel() {
    return Volunteering(
      id: id,
      name: name,
      category: category,
      description: description,
      schedule: schedule,
      address: address,
      lat: lat,
      lng: lng,
      imageUrl: imageUrl,
      volunteersQty: volunteersQty,
      capacity: capacity,
    );
  }
}
