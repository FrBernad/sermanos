import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sermanos/config/design_system/atoms/icons/sermanos_icons.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_shadows.dart';

import '../../../../config/design_system/tokens/sermanos_colors.dart';
import '../../../../config/design_system/tokens/sermanos_typography.dart';
import '../../../../features/postulate/application/controllers/postulate_view_mode_controller.dart';

class SermanosSearchBar extends HookConsumerWidget {
  const SermanosSearchBar({Key? key}) : super(key: key);

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
      child: FormBuilderField<String>(
        initialValue: initialValue,
        name: 'search',
        onReset: () => controller.text = initialValue,
        builder: (FormFieldState field) {
          return TextField(
            focusNode: focusNode,
            controller: controller,
            onChanged: (value) {
              field.didChange(value);
            },
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
                  ? Consumer(builder:
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
                          : IconButton(
                              icon: SermanosIcons.map(
                                  status: SermanosIconStatus.activated),
                              onPressed: () => ref
                                  .watch(postulateViewModeControllerProvider
                                      .notifier)
                                  .set(PostulateViewMode.map),
                            );
                    })
                  : IconButton(
                      icon: SermanosIcons.close(
                        status: SermanosIconStatus.enabledSecondary,
                      ),
                      onPressed: () {
                        controller.clear();
                        field.reset();
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
          );
        },
      ),
    );
  }
}
