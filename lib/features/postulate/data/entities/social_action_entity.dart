import '../../domain/models/social_action.dart';

class SocialActionEntity extends SocialAction {
  const SocialActionEntity({
    required socialActionId,
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
          id: socialActionId,
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

  factory SocialActionEntity.fromJson({
    required String socialActionId,
    required Map<String, dynamic> json,
  }) {
    return SocialActionEntity(
      socialActionId: socialActionId,
      name: json['name'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
      schedule: json['schedule'] as String,
      address: json['address'] as String,
      lat: json['lat'] as String,
      lng: json['lng'] as String,
      volunteersQty: json['volunteersQty'] as int,
      capacity: json['capacity'] as int,
      imageUrl: json['imageUrl'] as String,
    );
  }

  SocialAction toModel() {
    return SocialAction(
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
