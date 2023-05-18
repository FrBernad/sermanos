import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sermanos/config/design_system/atoms/icons/sermanos_icons.dart';
import 'package:sermanos/config/design_system/cellules/modals/modal.dart';
import 'package:sermanos/config/design_system/molecules/buttons/sermanos_CTA_button.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_grid.dart';

import '../../../../config/design_system/molecules/spinner/ser_manos_circular_progress_indicator.dart';
import '../../../../config/design_system/tokens/sermanos_colors.dart';
import '../../../../config/design_system/tokens/sermanos_typography.dart';
import '../../../core/presentation/widgets/error_message.dart';
import '../../application/controllers/get_social_action_by_id_controller.dart';
import '../../domain/models/social_action.dart';

class PostulateDetailScreen extends HookConsumerWidget {
  static const route = "/postulate/:id";

  static String routeFromId(String id) => '/postulate/$id';

  static const routeName = "postulateDetail";

  const PostulateDetailScreen({
    Key? key,
    required this.socialActionId,
  }) : super(key: key);

  final String socialActionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    final getSocialActionByIdController = ref.watch(
      getSocialActionByIdControllerProvider(socialActionId: socialActionId),
    );

    return getSocialActionByIdController.when(
      data: (socialAction) {
        return Scaffold(
          body: Column(
            children: [
              Stack(
                children: [
                  Image(
                    image: NetworkImage(socialAction.imageUrl),
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
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: SermanosIcons.back(status: SermanosIconStatus.back),
                    ),
                  ),
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
                        children: [
                          Text(
                            socialAction.name,
                            style: const SermanosTypography.headline01(),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            socialAction.description,
                            style: const SermanosTypography.body01(
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
                                  await _showConfirmationDialog(
                                context,
                                socialAction,
                              );
                            },
                            filled: true,
                          ),
                          const SizedBox(
                            height: 56,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) => const ErrorMessage(),
      loading: () => const SermanosCircularProgressIndicator(),
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    SocialAction socialAction,
  ) async {
    return await showDialog<bool?>(
      barrierDismissible: false,
      // barrierColor: AppColors.neutral0.withOpacity(0.1),
      context: context,
      builder: (BuildContext c) {
        return Modal(
          title: socialAction.name,
          schedule: socialAction.schedule,
          location: socialAction.address,
        );
      },
    );
  }
}
