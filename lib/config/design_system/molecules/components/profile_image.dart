import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:sermanos/config/design_system/atoms/icons/sermanos_icons.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_skeleton.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    Key? key,
    this.imageUrl,
    this.height = 110,
    this.width = 110,
    this.fromNetwork = true,
  }) : super(key: key);

  final String? imageUrl;
  final double height;
  final double width;
  final bool fromNetwork;

  @override
  Widget build(BuildContext context) {
    return imageUrl != null
        ? ClipOval(
            child: SizedBox(
              width: width,
              height: height,
              child: fromNetwork
                  ? CachedNetworkImage(
                      imageUrl: imageUrl!,
                      fit: BoxFit.cover,
                      errorWidget:
                          (BuildContext context, String url, dynamic error) {
                        return Image.asset(
                            "assets/images/sermanos_image_not_found.png");
                      },
                      placeholder: (BuildContext context, String url) {
                        return const SermanosSkeleton(rounded: false);
                      },
                    )
                  : Image.file(
                      File(
                        imageUrl!,
                      ),
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return Image.asset(
                            "assets/images/sermanos_image_not_found.png");
                      },
                    ),
            ),
          )
        : SizedBox(
            child: SermanosIcons.account(
              status: SermanosIconStatus.activatedTerciary,
            ),
          );
  }
}
