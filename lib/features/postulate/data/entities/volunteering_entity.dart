import '../../domain/models/volunteering.dart';

class VolunteeringEntity extends Volunteering {
  const VolunteeringEntity({
    required volunteeringId,
    required name,
    required category,
    required description,
    required schedule,
    required address,
    required lat,
    required lng,
    required imageUrl,
    required volunteersQty,
    required capacity,
  }) : super(
          id: volunteeringId,
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

  factory VolunteeringEntity.fromJson({
    required String volunteeringId,
    required Map<String, dynamic> json,
  }) {
    return VolunteeringEntity(
      volunteeringId: volunteeringId,
      name: json['name'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
      schedule: json['schedule'] as String,
      address: json['address'] as String,
      lat: json['lat'],
      lng: json['lng'],
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
