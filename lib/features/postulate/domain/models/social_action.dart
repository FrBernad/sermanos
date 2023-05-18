import 'package:equatable/equatable.dart';

class SocialAction extends Equatable {
  final String id;
  final String name;
  final String category;
  final String description;
  final String schedule;
  final String address;
  final String lat;
  final String lng;
  final String imageUrl;

  const SocialAction({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.schedule,
    required this.address,
    required this.lat,
    required this.lng,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id];
}
