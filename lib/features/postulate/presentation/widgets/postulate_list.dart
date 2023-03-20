import 'package:flutter/cupertino.dart';
import 'package:sermanos/features/postulate/presentation/widgets/postulate_card.dart';

class PostulateList extends StatelessWidget {
  const PostulateList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => const PostulateCard(),
        separatorBuilder: (context, index) => const SizedBox(height: 24),
        itemCount: 10
    );
  }
}
