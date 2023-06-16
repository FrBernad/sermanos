import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sermanos/config/design_system/atoms/icons/sermanos_icons.dart';
import 'package:sermanos/config/design_system/molecules/buttons/sermanos_map_button.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_shadows.dart';

import '../../../../config/design_system/tokens/sermanos_colors.dart';
import '../../../../config/design_system/tokens/sermanos_typography.dart';
import '../../../../features/postulate/application/controllers/postulate_view_mode_controller.dart';

class SermanosSearchBar extends HookConsumerWidget {
  const SermanosSearchBar({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNode = useFocusNode();
    useListenable(focusNode);

    const initialValue = '';
    final controller = useTextEditingController(text: initialValue);

    final bool isEmpty =
        useListenableSelector(controller, () => controller.text.isEmpty);

    return Container(
      decoration: BoxDecoration(
        color: SermanosColors.neutral0,
        borderRadius: BorderRadius.circular(2),
        boxShadow: SermanosShadows.shadow1,
      ),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          hintText: 'Buscar',
          hintStyle: const SermanosTypography.subtitle01().copyWith(
            color: SermanosColors.neutral75,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          prefixIcon: SermanosIcons.search(
            status: SermanosIconStatus.enabledSecondary,
          ),
          suffixIcon: isEmpty
              ? Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    final viewMode =
                        ref.watch(postulateViewModeControllerProvider);
                    return viewMode == PostulateViewMode.map
                        ? IconButton(
                            icon: SermanosIcons.list(
                              status: SermanosIconStatus.activated,
                            ),
                            onPressed: () => ref
                                .watch(postulateViewModeControllerProvider
                                    .notifier)
                                .set(PostulateViewMode.list),
                          )
                        : const SermanosMapButton();
                  },
                )
              : IconButton(
                  icon: SermanosIcons.close(
                    status: SermanosIconStatus.enabledSecondary,
                  ),
                  onPressed: () {
                    controller.clear();
                    onChanged(initialValue);
                  },
                ),
        ),
        onTapOutside: (e) {
          focusNode.unfocus();
        },
        onEditingComplete: () {
          focusNode.unfocus();
        },
        onSubmitted: (value) {
          focusNode.unfocus();
        },
      ),
    );
  }
}
