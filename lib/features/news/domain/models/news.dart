import 'package:equatable/equatable.dart';

class News extends Equatable {
  final String title;
  final String id;
  final String subtitle;
  final String description;
  final String imageUrl;

  const News({
    required this.title,
    required this.subtitle,
    required this.id,
    required this.description,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id];
}
