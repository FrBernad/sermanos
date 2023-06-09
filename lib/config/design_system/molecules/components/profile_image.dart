import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:sermanos/config/design_system/atoms/icons/sermanos_icons.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    Key? key,
    this.imageUrl,
  }) : super(key: key);

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return imageUrl != null
        ? ClipOval(
            child: SizedBox.fromSize(
              size: const Size.fromRadius(48), // Image radius
              child: CachedNetworkImage(
                imageUrl: imageUrl!,
                height: 120,
                width: 120,
                fit: BoxFit.cover,
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
