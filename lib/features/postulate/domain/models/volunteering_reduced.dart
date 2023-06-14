import 'package:equatable/equatable.dart';

class VolunteeringReduced extends Equatable {
  final String id;
  final String name;
  final String category;
  final double lat;
  final double lng;

  const VolunteeringReduced({
    required this.id,
    required this.name,
    required this.category,
    required this.lat,
    required this.lng,
  });

  @override
  List<Object?> get props => [id];
}
