import 'package:flutter/material.dart';
import 'package:sermanos/features/news/domain/models/news.dart';
import 'package:sermanos/features/news/presentation/widgets/news_card.dart';

class NewsScreen extends StatelessWidget {
  static const route = "/?tab=news";
  static const routeName = "news";

  final List<News> news = [
    const News(
      subtitle: "reporte 2820",
      title: "Ser donante voluntario",
      description:
          "Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre",
      newsId: "0",
      imageUrl:
          'https://s3-alpha-sig.figma.com/img/839a/009b/380a4b7407209dad0aeec257c6df7298?Expires=1680480000&Signature=Lyb47CAhn9T-lyoXlgPqunLLJ9vHiO6oImjZWX64kJBVl0I6rFLM3-zHMbhVtdAkz88M9LoxlCaOgWLEYUDEsxA8Xcn~IguEzK19kj-oGmjUallHyHAMQCi5ePpHf~syH4D9O5T8x6tsJT6zW394s7HSAB9i5tFM~v5BunYbM4fzFXUNwOGIKjp4y95wMLUWX5Dz3Kgvohj2khp0xNr~J13Pqcjv2FyjUhsOw-OD7xIvw~w2xvvNpnBQoHF0v7Gk5Sreu3k1DWj4s4WxpzjEJwniMFhyZYwfc926Q9KYesL-KgIb4y4f4ndpuCOQ4qqqK88V2mJDR1BZ~Bg4X-jnFw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    ),
    const News(
      subtitle: "Noticias de cuyo",
      title: "Juntamos residuos",
      description:
          "Voluntarios de Godoy Cruz, se sumaron a la limpieza de un cauce en las inmediaciones.",
      newsId: "1",
      imageUrl:
          'https://s3-alpha-sig.figma.com/img/9d9d/8b2b/1b4848e87872562e2c1a855aa6f6ff14?Expires=1680480000&Signature=LLfOKLmp8DvfRrnKL0iaXA-gDtVnsUbGps2AUadQhYE4UvwnocEumA7fDxdnS4z3xaGqfmZmq2XW4-5HrdxCVrh~NhEtgd-BIBcBi6wX6CFeewq-QNmU1cQT6bAcwUf3DZBzuCoKSGuibV144xeGCe1SXjMCZj2jmeJyQnpPgbd8gnMOt~KTwg1ydlvkr02E2Ps2Rsn6bKk5jRWkmnJy52-NAJy1POSLfZSSV9iyTgPrKMpZA49RV48P0U5oNhfoeNYmIiruv3sGTKUhNlADRVclQcrnEprn6ErV5XdpNv0coUPd9SmeWsJ58ZGKc~5YB80WgHDN1ius7B3st9aq-Q__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    ),
    const News(
      subtitle: "Diario la nación",
      title: "Adoptar mascotas",
      description:
          "Ayudanos a limpiar las calles de perros callejeros adoptándolos evitando la sobrepoblación de las perreras.",
      newsId: "2",
      imageUrl:
          'https://s3-alpha-sig.figma.com/img/614a/f89d/ddcf837280c90c026e0b41672fbd114a?Expires=1680480000&Signature=SjEtbNDy0xdloiM8c9PU~3hMQlcbXZNozPWOxzT6I4SVdSPloKpnxuAuTBfiCvFJ2XUVL8mGbO8K-OswBqys8iS5Zu7MMacN946QyWSYnSS2wmx~wRNvVgS6aYtDxFtQrk9EzN-cQSfsjm4M2bVMroohrFxWDfV5Ktt1rWpyrPkeP45gPAubD1mkX3v1HnvBiG2-OsgBXZ1y2IxS5RrN9M0ClXVd7M39jRF7-b~1LEFvE2achlH6ZfdBRKHKuoaEKk-tjng561ipaXuZFxu6dZ6pJeV-byWB2somho-~9CVc1QgJJm-yBfGW3bTPGN6xzUmEZC0hfeu6uqhM2IOvcA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    ),
    const News(
      subtitle: "La voz del interior",
      title: "Preservamos la fauna",
      description:
          "Córdoba se une a la campaña del gobierno cuidar la fauna en época de sequía",
      newsId: "3",
      imageUrl:
          'https://s3-alpha-sig.figma.com/img/bf1c/454a/07b44933fe080e986551bc68e44ac23c?Expires=1680480000&Signature=iMKh4ETkqSKDT3OhSfQFZx46bNxcnqI2iiPTXlKPZDKykUHjZTeu4h5F5loULAzRvFRD0DFLklgFqNVBu3aXbYzwVIgHBEuRs6uM6GF5rFLX8GSIoPtdVJHVIgN5NaWE5p1yUZGawquZJqL-31aZHE~LfhpK9aq~Jmbtt9GRSW2T4dNop0VGRhQq0gL-j54FvOcJ4MLxTcvnzFveaQA5Xvxq01o79rnhzyYdZs2cRMTUJKJdC5hq-gTwNlEQjLO7uUjM~-G98aKZ5-29BdrTniOVZIe6~0n5VJlgZWTakrSMMFMERM-Rvc6H4ZS9bhjketCh4ITqQjs5eUpw1sfuzA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    )
  ];

  NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(

      child: Padding(
        padding: const EdgeInsets.only(
          top: 32,
        ),
        child: ListView.builder(
          itemCount: news.length,
          itemBuilder: (context, index) {
            return NewsCard(news: news[index]);
          },
        ),
      ),
    );
  }
}
