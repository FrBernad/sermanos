import '../../../domain/models/social_action.dart';

class RemoteSocialActionEntity extends SocialAction {
  const RemoteSocialActionEntity({
    required socialActionId,
    required name,
    required category,
    required description,
    required schedule,
    required address,
    required lat,
    required lng,
    required imageUrl,
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
        );

  factory RemoteSocialActionEntity.fromJson({
    required String socialActionId,
    required Map<String, dynamic> json,
  }) {
    return RemoteSocialActionEntity(
      socialActionId: socialActionId,
      name: json['name'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
      schedule: json['schedule'] as String,
      address: json['address'] as String,
      lat: json['lat'] as String,
      lng: json['lng'] as String,
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
    );
  }
}
