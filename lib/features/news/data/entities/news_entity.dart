import 'package:sermanos/features/news/domain/models/news.dart';

class NewsEntity extends News {
  const NewsEntity({
    required title,
    required subtitle,
    required newsId,
    required description,
    required imageUrl,
  }) : super(
          subtitle: subtitle,
          title: title,
          description: description,
          id: newsId,
          imageUrl: imageUrl,
        );

  factory NewsEntity.fromJson({
    required String newsId,
    required Map<String, dynamic> json,
  }) {
    return NewsEntity(
      subtitle: json['subtitle'],
      title: json['title'],
      description: json['description'],
      newsId: newsId,
      imageUrl: json['imageUrl'],
    );
  }

  News toModel() {
    return News(
      subtitle: subtitle,
      title: title,
      description: description,
      id: id,
      imageUrl: imageUrl,
    );
  }
}
