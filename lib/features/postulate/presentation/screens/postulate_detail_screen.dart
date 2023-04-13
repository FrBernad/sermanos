import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sermanos/config/design_system/atoms/icons/sermanos_icons.dart';
import 'package:sermanos/config/design_system/cellules/modals/modal.dart';
import 'package:sermanos/config/design_system/molecules/buttons/sermanos_CTA_button.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_grid.dart';

import '../../../../config/design_system/tokens/sermanos_colors.dart';
import '../../../../config/design_system/tokens/sermanos_typography.dart';

class PostulateDetailScreen extends HookConsumerWidget {
  static const route = "/postulate/:id";

  static String routeFromId(String id) => '/postulate/$id';

  static const routeName = "postulateDetail";

  const PostulateDetailScreen({
    Key? key,
    required this.postulateId,
  }) : super(key: key);

  final String postulateId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const String imageUrl =
        'https://s3-alpha-sig.figma.com/img/6160/48a8/56fafc1f797d16aeaaa7f76477bdc239?Expires=1682294400&Signature=YANfeiuGuydv6nDtHVG2qlUxSWBdpHQ1KP4TdDWlxB8kDDuR6U~LPRGnEoO~xerlyn1mO4Mt8mhUrTL9O6vON8Jt6edFFMk~3xcu0AFQKp0sQ9TyptAdjybQgRW13RcXNMyPqojtzvD6bmH4SPnU31L9vEYdu~oKvl9XOQT0rm~YqkqiagJO0SliSNavpR3gx5~D8x384269bhfKvaznBwjmuReLRxs2QaGP1capML3IwGWNwcIr~t~gMyDicwI4cvu7M0GU2M~xhLJT8Uq6D-3pZYjI14E4LSAS-OWDYDIF5BlDwOpCLlmD-Oe7ELqTjk5qx7OmSTx8xmwiLxDutA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4';

    useEffect(() {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.immersive,
      );
      return () {
        SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.manual,
          overlays: SystemUiOverlay.values,
        );
      };
    }, []);

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const Image(
                image: NetworkImage(imageUrl),
                height: 243,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned.fill(
                child: SermanosGrid(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: SermanosColors.neutral0,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          SermanosColors.neutral100,
                          Colors.transparent,
                        ],
                        stops: [0.0, 0.3555],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 24,
                left: 24,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child:
                      SermanosIcons.back(status: SermanosIconStatus.back),
                ),
              )
            ],
          ),
          const SizedBox(height: 32),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Un Techo para mi País',
                        style: SermanosTypography.headline01(),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'A dos horas al sur de Vicente López en la ciudad de Buenos Aires.',
                        style: SermanosTypography.body01(
                          color: SermanosColors.neutral75,
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SermanosCTAButton(
                          text: 'Postularme',
                          onPressed: () async {
                            final bool? confirmed =
                                await _showConfirmationDialog(context);
                          },
                          filled: true),
                      const SizedBox(height: 56),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> _showConfirmationDialog(BuildContext context) async {
    return await showDialog<bool?>(
      barrierDismissible: false,
      // barrierColor: AppColors.neutral0.withOpacity(0.1),
      context: context,
      builder: (BuildContext c) {
        return const Modal(
          title: 'Un techo para mi País',
          schedule: 'Días sábados de 9.00 a 17.00 horas.',
          location: 'Caballito',
        );
      },
    );
  }
}
