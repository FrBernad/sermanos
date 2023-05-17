import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sermanos/features/news/data/entities/remote/remote_news_entity.dart';

abstract class NewsRemoteDataSource {
  Future<List<RemoteNewsEntity>> getNews();

  Future<Option<RemoteNewsEntity>> getNewsById({
    required String newsId,
  });
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  NewsRemoteDataSourceImpl({
    required firebaseDatabaseClient,
  }) : _firebaseDatabaseClient = firebaseDatabaseClient;

  final FirebaseFirestore _firebaseDatabaseClient;

  final Map<String, dynamic> news = {
    "0": {
      "subtitle": "reporte 2820",
      "title": "Ser donante voluntario",
      "description":
          "Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre",
      "imageUrl":
          'https://s3-alpha-sig.figma.com/img/839a/009b/380a4b7407209dad0aeec257c6df7298?Expires=1682294400&Signature=onpguDNeI4j68EPVwlvWutt6hMiKF7k8J72co0z-rUcT3TKWFpbQEM02u9QHD-c8juW5HHBrMguTXRc-cHGDhU~MEqxWQWS~JeXThczluUCX-WQ5c7CY9-Lk5dHCk7XXU7RPPn3P4BmknS6lOOdLj-oKjObSvz~m--o3tRcKBE4GK3pGTl0peHugQA6WsE6mNJXubimKviduIE~mhT9-GgTDR6roMW0EGvtWtJcyOHKcfZJsikUVf4rA5RPjYO9TFVqLQ9BICs7PdeKIQeNr8JETQY6kO1GijUlc8jheURlwfbm5xvII44-oQLnUOgeFK3NTpaDeFTGwlkxNhiGnnw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    },
    "1": {
      "subtitle": "Noticias de cuyo",
      "title": "Juntamos residuos",
      "description":
          "Voluntarios de Godoy Cruz, se sumaron a la limpieza de un cauce en las inmediaciones.",
      "imageUrl":
          'https://s3-alpha-sig.figma.com/img/839a/009b/380a4b7407209dad0aeec257c6df7298?Expires=1682294400&Signature=onpguDNeI4j68EPVwlvWutt6hMiKF7k8J72co0z-rUcT3TKWFpbQEM02u9QHD-c8juW5HHBrMguTXRc-cHGDhU~MEqxWQWS~JeXThczluUCX-WQ5c7CY9-Lk5dHCk7XXU7RPPn3P4BmknS6lOOdLj-oKjObSvz~m--o3tRcKBE4GK3pGTl0peHugQA6WsE6mNJXubimKviduIE~mhT9-GgTDR6roMW0EGvtWtJcyOHKcfZJsikUVf4rA5RPjYO9TFVqLQ9BICs7PdeKIQeNr8JETQY6kO1GijUlc8jheURlwfbm5xvII44-oQLnUOgeFK3NTpaDeFTGwlkxNhiGnnw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    },
    "2": {
      "subtitle": "Diario la nación",
      "title": "Adoptar mascotas",
      "description":
          "Ayudanos a limpiar las calles de perros callejeros adoptándolos evitando la sobrepoblación de las perreras.",
      "imageUrl":
          'https://s3-alpha-sig.figma.com/img/839a/009b/380a4b7407209dad0aeec257c6df7298?Expires=1682294400&Signature=onpguDNeI4j68EPVwlvWutt6hMiKF7k8J72co0z-rUcT3TKWFpbQEM02u9QHD-c8juW5HHBrMguTXRc-cHGDhU~MEqxWQWS~JeXThczluUCX-WQ5c7CY9-Lk5dHCk7XXU7RPPn3P4BmknS6lOOdLj-oKjObSvz~m--o3tRcKBE4GK3pGTl0peHugQA6WsE6mNJXubimKviduIE~mhT9-GgTDR6roMW0EGvtWtJcyOHKcfZJsikUVf4rA5RPjYO9TFVqLQ9BICs7PdeKIQeNr8JETQY6kO1GijUlc8jheURlwfbm5xvII44-oQLnUOgeFK3NTpaDeFTGwlkxNhiGnnw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    },
    "3": {
      "subtitle": "La voz del interior",
      "title": "Preservamos la fauna",
      "description":
          "Córdoba se une a la campaña del gobierno cuidar la fauna en época de sequía",
      "imageUrl":
          'https://s3-alpha-sig.figma.com/img/839a/009b/380a4b7407209dad0aeec257c6df7298?Expires=1682294400&Signature=onpguDNeI4j68EPVwlvWutt6hMiKF7k8J72co0z-rUcT3TKWFpbQEM02u9QHD-c8juW5HHBrMguTXRc-cHGDhU~MEqxWQWS~JeXThczluUCX-WQ5c7CY9-Lk5dHCk7XXU7RPPn3P4BmknS6lOOdLj-oKjObSvz~m--o3tRcKBE4GK3pGTl0peHugQA6WsE6mNJXubimKviduIE~mhT9-GgTDR6roMW0EGvtWtJcyOHKcfZJsikUVf4rA5RPjYO9TFVqLQ9BICs7PdeKIQeNr8JETQY6kO1GijUlc8jheURlwfbm5xvII44-oQLnUOgeFK3NTpaDeFTGwlkxNhiGnnw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    },
  };

  @override
  Future<List<RemoteNewsEntity>> getNews() {
    List<RemoteNewsEntity> newsEntities = [];

    for (MapEntry<String, dynamic> n in news.entries) {
      RemoteNewsEntity remoteEntity = RemoteNewsEntity.fromJson(
          newsId: n.key, json: Map<String, dynamic>.from(n.value));
      newsEntities.add(remoteEntity);
    }
    return Future.value(newsEntities);
  }

  @override
  Future<Option<RemoteNewsEntity>> getNewsById({
    required String newsId,
  }) {
    RemoteNewsEntity? newsEntity;

    for (MapEntry<String, dynamic> n in news.entries) {
      if (n.key == newsId) {
        newsEntity = RemoteNewsEntity.fromJson(
          newsId: n.key,
          json: Map<String, dynamic>.from(n.value),
        );
        break;
      }
    }
    return Future.value(Option.fromNullable(newsEntity));
  }
}
