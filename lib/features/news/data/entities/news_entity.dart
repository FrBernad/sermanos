import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sermanos/features/news/domain/models/news.dart';

class NewsEntity {
  static const String collectionName = 'news';

  final String id;
  final String title;
  final String subtitle;
  final String source;
  final String content;
  final String imageUrl;
  final DateTime creationTime;

  const NewsEntity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.source,
    required this.content,
    required this.imageUrl,
    required this.creationTime,
  });

  factory NewsEntity.fromJson({
    required String newsId,
    required Map<String, dynamic> json,
  }) {
    DateTime creationTime = DateTime.now();
    if (json['creationTime'] != null) {
      try {
        creationTime = (json['creationTime'] as Timestamp).toDate();
      } on StateError {
        creationTime = DateTime.now();
      }
    }

    return NewsEntity(
      id: newsId,
      subtitle: json['subtitle'],
      title: json['title'],
      content: json['content'],
      source: json['source'],
      imageUrl: json['imageUrl'],
      creationTime: creationTime,
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
      creationTime: creationTime,
    );
  }
}
