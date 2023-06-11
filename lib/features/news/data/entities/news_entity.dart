import 'package:sermanos/features/news/domain/models/news.dart';

class NewsEntity {
  final String id;
  final String title;
  final String subtitle;
  final String source;
  final String content;
  final String imageUrl;

  const NewsEntity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.source,
    required this.content,
    required this.imageUrl,
  });

  factory NewsEntity.fromJson({
    required String newsId,
    required Map<String, dynamic> json,
  }) {
    return NewsEntity(
      id: newsId,
      subtitle: json['subtitle'],
      title: json['title'],
      content: json['content'],
      source: json['source'],
      imageUrl: json['imageUrl'],
    );
  }

  News toModel() {
    return News(
      id: id,
      subtitle: subtitle,
      title: title,
      content: content,
      source: source,
      imageUrl: imageUrl,
    );
  }
}
