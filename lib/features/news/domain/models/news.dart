import 'package:equatable/equatable.dart';

class News extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String source;
  final String content;
  final String imageUrl;

  final DateTime creationTime;

  const News({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.source,
    required this.content,
    required this.imageUrl,
    required this.creationTime,
  });

  @override
  List<Object?> get props => [id];
}
