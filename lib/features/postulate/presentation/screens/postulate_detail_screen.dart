import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sermanos/config/design_system/atoms/icons/sermanos_icons.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_grid.dart';
import 'package:sermanos/features/postulate/presentation/widgets/postulate_details_decision.dart';
import 'package:sermanos/features/postulate/presentation/widgets/postulate_map_card.dart';

import '../../../../config/design_system/molecules/components/vacancies.dart';
import '../../../../config/design_system/molecules/spinner/ser_manos_circular_progress_indicator.dart';
import '../../../../config/design_system/tokens/sermanos_colors.dart';
import '../../../../config/design_system/tokens/sermanos_typography.dart';
import '../../../core/presentation/widgets/error_message.dart';
import '../../application/controllers/get_volunteering_by_id_controller.dart';

class PostulateDetailScreen extends HookConsumerWidget {
  static const route = "/postulate/:id";

  static String routeFromId(String id) => '/postulate/$id';

  static const routeName = "postulateDetail";

  const PostulateDetailScreen({
    Key? key,
    required this.volunteeringId,
  }) : super(key: key);

  final String volunteeringId;

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

    final getVolunteeringByIdController = ref.watch(
      getVolunteeringByIdControllerProvider(volunteeringId: volunteeringId),
    );

    return getVolunteeringByIdController.when(
      data: (volunteering) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                ColoredBox(
                  color: SermanosColors.neutral200,
                  child: SafeArea(
                    top: true,
                    bottom: false,
                    left: false,
                    right: false,
                    child: Stack(
                      children: [
                        Image(
                          image: NetworkImage(volunteering.imageUrl),
                          height: 243,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: SermanosColors.neutral0,
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  SermanosColors.neutral200,
                                  Colors.transparent,
                                ],
                                stops: [0.0, 0.3555],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          child: IconButton(
                            padding: const EdgeInsets.all(
                                SermanosGrid.horizontalSpacing),
                            onPressed: () => Navigator.of(context).pop(),
                            icon: SermanosIcons.back(
                                status: SermanosIconStatus.back),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            volunteering.category.toUpperCase(),
                            style: const SermanosTypography.overline(
                              color: SermanosColors.neutral75,
                            ),
                          ),
                          Text(
                            volunteering.name,
                            style: const SermanosTypography.headline01(),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            volunteering.description,
                            style: const SermanosTypography.subtitle01(
                              color: SermanosColors.secondary200,
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            "Sobre la actividad",
                            style: SermanosTypography.headline02(
                              color: SermanosColors.neutral100,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            volunteering.about,
                            style: const SermanosTypography.body01(),
                          ),
                          const SizedBox(height: 24),
                          PostulateMapCard(
                            volunteering: volunteering,
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            "Participar del voluntariado",
                            style: SermanosTypography.headline02(
                              color: SermanosColors.neutral100,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Requisitos",
                            style: SermanosTypography.subtitle01(),
                          ),
                          const SizedBox(height: 8),
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: volunteering.requirements.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  const Icon(
                                    Icons.circle,
                                    color: SermanosColors.neutral100,
                                    size: 5,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    volunteering.requirements[index],
                                    style: const SermanosTypography.body01(),
                                  ),
                                ],
                              );
                            },
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Disponibilidad",
                            style: SermanosTypography.subtitle01(),
                          ),
                          const SizedBox(height: 8),
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: volunteering.availability.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  const Icon(
                                    Icons.circle,
                                    color: SermanosColors.neutral100,
                                    size: 5,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    volunteering.availability[index],
                                    style: const SermanosTypography.body01(),
                                  ),
                                ],
                              );
                            },
                          ),
                          const SizedBox(height: 8),
                          Vacancies(
                            vacancy: volunteering.capacity -
                                volunteering.volunteersQty,
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                      PostulateDetailDecision(volunteering: volunteering),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) => const ErrorMessage(),
      loading: () => const SermanosCircularProgressIndicator(),
    );
  }
}
