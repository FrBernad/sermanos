import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sermanos/config/design_system/atoms/icons/sermanos_icons.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_shadows.dart';

import '../../../../config/design_system/tokens/sermanos_colors.dart';
import '../../../../config/design_system/tokens/sermanos_typography.dart';

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
        initialValue: '',
        name: 'search',
        onReset: () => controller.text = initialValue,
        builder: (FormFieldState field) {
          return TextField(
            focusNode: focusNode,
            controller: controller,
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
              suffixIcon: IconButton(
                icon: isEmpty
                    ? SermanosIcons.search(status: SermanosIconStatus.enabled)
                    : SermanosIcons.close(status: SermanosIconStatus.enabled),
                onPressed: () {
                  if (!isEmpty) {
                    controller.clear();
                    field.reset();
                  }
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
