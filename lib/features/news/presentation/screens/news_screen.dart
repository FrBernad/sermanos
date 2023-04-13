import 'package:flutter/material.dart';
import 'package:sermanos/config/design_system/cellules/cards/news_card/sermanos_news_card.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_grid.dart';
import 'package:sermanos/features/news/domain/models/news.dart';

class NewsScreen extends StatelessWidget {
  static const route = "/news";
  static const routeName = "news";

  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(
        SermanosGrid.horizontalSpacing,
        32,
        SermanosGrid.horizontalSpacing,
        32,
      ),
      itemCount: news.length,
      itemBuilder: (context, index) {
        return SermanosNewsCard(news: news[index]);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 24),
    );
  }
}

final List<News> news = [
  const News(
    subtitle: "reporte 2820",
    title: "Ser donante voluntario",
    description:
        "Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre",
    newsId: "0",
    imageUrl:
        'https://s3-alpha-sig.figma.com/img/839a/009b/380a4b7407209dad0aeec257c6df7298?Expires=1682294400&Signature=onpguDNeI4j68EPVwlvWutt6hMiKF7k8J72co0z-rUcT3TKWFpbQEM02u9QHD-c8juW5HHBrMguTXRc-cHGDhU~MEqxWQWS~JeXThczluUCX-WQ5c7CY9-Lk5dHCk7XXU7RPPn3P4BmknS6lOOdLj-oKjObSvz~m--o3tRcKBE4GK3pGTl0peHugQA6WsE6mNJXubimKviduIE~mhT9-GgTDR6roMW0EGvtWtJcyOHKcfZJsikUVf4rA5RPjYO9TFVqLQ9BICs7PdeKIQeNr8JETQY6kO1GijUlc8jheURlwfbm5xvII44-oQLnUOgeFK3NTpaDeFTGwlkxNhiGnnw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
  ),
  const News(
    subtitle: "Noticias de cuyo",
    title: "Juntamos residuos",
    description:
        "Voluntarios de Godoy Cruz, se sumaron a la limpieza de un cauce en las inmediaciones.",
    newsId: "1",
    imageUrl:
        'https://s3-alpha-sig.figma.com/img/839a/009b/380a4b7407209dad0aeec257c6df7298?Expires=1682294400&Signature=onpguDNeI4j68EPVwlvWutt6hMiKF7k8J72co0z-rUcT3TKWFpbQEM02u9QHD-c8juW5HHBrMguTXRc-cHGDhU~MEqxWQWS~JeXThczluUCX-WQ5c7CY9-Lk5dHCk7XXU7RPPn3P4BmknS6lOOdLj-oKjObSvz~m--o3tRcKBE4GK3pGTl0peHugQA6WsE6mNJXubimKviduIE~mhT9-GgTDR6roMW0EGvtWtJcyOHKcfZJsikUVf4rA5RPjYO9TFVqLQ9BICs7PdeKIQeNr8JETQY6kO1GijUlc8jheURlwfbm5xvII44-oQLnUOgeFK3NTpaDeFTGwlkxNhiGnnw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
  ),
  const News(
    subtitle: "Diario la nación",
    title: "Adoptar mascotas",
    description:
        "Ayudanos a limpiar las calles de perros callejeros adoptándolos evitando la sobrepoblación de las perreras.",
    newsId: "2",
    imageUrl:
        'https://s3-alpha-sig.figma.com/img/839a/009b/380a4b7407209dad0aeec257c6df7298?Expires=1682294400&Signature=onpguDNeI4j68EPVwlvWutt6hMiKF7k8J72co0z-rUcT3TKWFpbQEM02u9QHD-c8juW5HHBrMguTXRc-cHGDhU~MEqxWQWS~JeXThczluUCX-WQ5c7CY9-Lk5dHCk7XXU7RPPn3P4BmknS6lOOdLj-oKjObSvz~m--o3tRcKBE4GK3pGTl0peHugQA6WsE6mNJXubimKviduIE~mhT9-GgTDR6roMW0EGvtWtJcyOHKcfZJsikUVf4rA5RPjYO9TFVqLQ9BICs7PdeKIQeNr8JETQY6kO1GijUlc8jheURlwfbm5xvII44-oQLnUOgeFK3NTpaDeFTGwlkxNhiGnnw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
  ),
  const News(
    subtitle: "La voz del interior",
    title: "Preservamos la fauna",
    description:
        "Córdoba se une a la campaña del gobierno cuidar la fauna en época de sequía",
    newsId: "3",
    imageUrl:
        'https://s3-alpha-sig.figma.com/img/839a/009b/380a4b7407209dad0aeec257c6df7298?Expires=1682294400&Signature=onpguDNeI4j68EPVwlvWutt6hMiKF7k8J72co0z-rUcT3TKWFpbQEM02u9QHD-c8juW5HHBrMguTXRc-cHGDhU~MEqxWQWS~JeXThczluUCX-WQ5c7CY9-Lk5dHCk7XXU7RPPn3P4BmknS6lOOdLj-oKjObSvz~m--o3tRcKBE4GK3pGTl0peHugQA6WsE6mNJXubimKviduIE~mhT9-GgTDR6roMW0EGvtWtJcyOHKcfZJsikUVf4rA5RPjYO9TFVqLQ9BICs7PdeKIQeNr8JETQY6kO1GijUlc8jheURlwfbm5xvII44-oQLnUOgeFK3NTpaDeFTGwlkxNhiGnnw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
  )
];
