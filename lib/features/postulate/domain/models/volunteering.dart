import 'package:equatable/equatable.dart';

class Volunteering extends Equatable {
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

  const Volunteering({
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

  @override
  List<Object?> get props => [id];
}
