import 'package:sermanos/features/news/domain/models/news.dart';

class RemoteNewsEntity extends News {
  const RemoteNewsEntity({
    required title,
    required subtitle,
    required newsId,
    required description,
    required imageUrl,
  }) : super(
            subtitle: subtitle,
            title: title,
            description: description,
            newsId: newsId,
            imageUrl: imageUrl);

  factory RemoteNewsEntity.fromJson({
    required String newsId,
    required Map<String, dynamic> json,
  }) {
    return RemoteNewsEntity(
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
        newsId: newsId,
        imageUrl: imageUrl);
  }
}
