import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sermanos/features/news/data/datasources/remote/news_remote_data_source.dart';
import 'package:sermanos/features/news/data/entities/news_entity.dart';
import 'package:sermanos/features/news/domain/models/news.dart';

void main() {
  test(
    'Volunteering Entity to Model',
    () {
      NewsEntity expectedNewsEntity = const NewsEntity(
        id: "1",
        title: "Título 1",
        subtitle: "Subtítulo 1",
        source: "Fuente 1",
        content: "Contenido 1",
        imageUrl: "https://unsplash.com/photos/qQWxYWVKSsc",
      );

      News expectedNewsModel = const News(
        id: "1",
        title: "Título 1",
        subtitle: "Subtítulo 1",
        source: "Fuente 1",
        content: "Contenido 1",
        imageUrl: "https://unsplash.com/photos/qQWxYWVKSsc",
      );

      expect(
        expectedNewsEntity.toModel(),
        expectedNewsModel,
      );
    },
  );

  test("Get news from firestore", () async {
    final FakeFirebaseFirestore fakeFirebaseFirestore = FakeFirebaseFirestore();

    final newsRemoteDataSource = NewsRemoteDataSourceImpl(
      firebaseDatabaseClient: fakeFirebaseFirestore,
    );

    final mockDocumentReference =
        fakeFirebaseFirestore.collection(NewsEntity.collectionName).doc("1");

    final Map<String, dynamic> mockNewsMap = {
      "title": "Título 1",
      "subtitle": "Subtítulo 1",
      "source": "Fuente 1",
      "content": "Contenido 1",
      "imageUrl": "https://unsplash.com/photos/qQWxYWVKSsc",
    };

    await mockDocumentReference.set(mockNewsMap);

    final actualNewsEntityList = await newsRemoteDataSource.getNews();

    final actualNewsModelList =
        actualNewsEntityList.map((e) => e.toModel()).toList();

    final expectedNewsEntityList = [
      NewsEntity.fromJson(
        newsId: "1",
        json: mockNewsMap,
      ),
    ];

    final expectedNewsModelList =
        expectedNewsEntityList.map((e) => e.toModel()).toList();

    expect(actualNewsModelList, expectedNewsModelList);
  });
}
