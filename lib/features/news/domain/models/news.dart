import 'package:equatable/equatable.dart';

class News extends Equatable {
  final String title;
  final String newsId;
  final String subtitle;
  final String description;
  final String imageUrl;

  const News({
    required this.title,
    required this.subtitle,
    required this.newsId,
    required this.description,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [newsId];
}
