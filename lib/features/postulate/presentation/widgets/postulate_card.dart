import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:sermanos/config/theme/app_text_styles.dart';

import '../../../../config/theme/app_colors.dart';
import '../screens/postulate_detail_screen.dart';

class PostulateCard extends StatelessWidget {
  const PostulateCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const imageUrl =
        'https://s3-alpha-sig.figma.com/img/6160/48a8/56fafc1f797d16aeaaa7f76477bdc239?Expires=1680480000&Signature=aWk2j9v609VGMNfCiuM6N0PDksdpCRH0KWj-Rj-8qa5uVsQkaI1vbK-X2lsoV7mnnA3hj-jwaHwb89cBig-KdkIdRUIBsbBpdBHp9pA-7Hzi9vxEkI622c6D2UoI9vrDHAtlUUVyxtyWqom3i9GpXWpjQXzdMww3UIGx8F52PK6bIv5tVcVP1~Jqx0UD0vUE34Yh04ONKE1820jWxcHOAq9oTJShXH3PPBUN90rC6VFRMgonQDnRjYEoM4lpvOOSrfRdOefd3yyFzfs8tDOJ64lve1SA6fQ9baeVRWRrkMzyrbVkqzJEdRSZ7I9jWB0kick3-77ieLNf94Ti-WXFbQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4';

    return GestureDetector(
      onTap: () {
        context.beamToNamed(PostulateDetailScreen.routeFromId('2'));
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.neutral0,
          borderRadius: BorderRadius.circular(2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: const Offset(0, 2), // changes position of shadow
              blurRadius: 6,
              spreadRadius: 2,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.30),
              offset: const Offset(0, 1), // changes position of shadow
              blurRadius: 2,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Image(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
              height: 138,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Acción Social'.toUpperCase(),
                        style: AppTextStyles.overline.copyWith(
                          color: AppColors.neutral75,
                        ),
                      ),
                      const Text(
                        'Un Techo para mi País',
                        style: AppTextStyles.subtitle01,
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.favorite_outline,
                        color: AppColors.primary100,
                        size: 24,
                      ),
                      SizedBox(width: 23),
                      Icon(
                        Icons.location_on,
                        color: AppColors.primary100,
                        size: 24,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
