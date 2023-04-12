import 'package:flutter/material.dart';

class Information extends StatelessWidget {
  const Information(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.description});

  final String title;
  final String subtitle;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        left: 8,
        right: 8,
        bottom: 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subtitle.toUpperCase(),
            style: Theme.of(context).textTheme.labelSmall,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
