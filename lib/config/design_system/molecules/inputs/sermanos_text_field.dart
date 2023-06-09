import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_typography.dart';

import '../../atoms/icons/sermanos_icons.dart';

class SermanosTextField extends HookConsumerWidget {
  const SermanosTextField({
    Key? key,
    required this.formField,
    required this.initialValue,
    this.enabled = true,
    this.password = false,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.label,
    this.placeholder,
    this.validators,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final String formField;
  final String? initialValue;
  final bool enabled;
  final bool password;
  final FloatingLabelBehavior floatingLabelBehavior;
  final String? label;
  final String? placeholder;
  final List<String? Function(String?)>? validators;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNode = useFocusNode();
    useListenable(focusNode);

    final controller = useTextEditingController(text: initialValue);

    final bool isEmpty =
        useListenableSelector(controller, () => controller.text.isEmpty);

    final isObscured = useState(password);

    return FormBuilderField<String>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: initialValue,
      name: formField,
      onReset: () => controller.text = initialValue ?? '',
      validator: (value) {
        if (focusNode.hasFocus) {
          return null;
        }
        if (validators != null) {
          for (final validator in validators!) {
            final error = validator(value);
            if (error != null) {
              return error;
            }
          }
        }
        return null;
      },
      builder: (FormFieldState field) {
        return TextField(
          cursorColor: SermanosColors.secondary200,
          obscureText: isObscured.value,
          enabled: enabled,
          onChanged: (value) => field.didChange(value),
          focusNode: focusNode,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            hintText: placeholder,
            hintStyle: SermanosTypography.subtitle01(
              color:
                  enabled ? SermanosColors.neutral50 : SermanosColors.neutral25,
            ),
            labelText: label,
            labelStyle: SermanosTypography.subtitle01(
              color: enabled
                  ? focusNode.hasFocus
                      ? SermanosColors.secondary200
                      : SermanosColors.neutral75
                  : SermanosColors.neutral50,
            ),
            floatingLabelBehavior: floatingLabelBehavior,
            floatingLabelStyle: SermanosTypography.caption(
              color: enabled
                  ? focusNode.hasFocus
                      ? SermanosColors.secondary200
                      : SermanosColors.neutral75
                  : SermanosColors.neutral50,
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: SermanosColors.neutral50,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: SermanosColors.secondary200,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: SermanosColors.neutral75,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: SermanosColors.error100,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            errorStyle: const SermanosTypography.body01(
              color: SermanosColors.error100,
            ),
            errorMaxLines: 3,
            errorText: field.errorText,
            suffixIcon: !enabled
                ? null
                : password
                    ? IconButton(
                        icon: SermanosIcons.showFilled(
                          status: SermanosIconStatus.enabledSecondary,
                          hide: isObscured.value,
                        ),
                        onPressed: () {
                          isObscured.value = !isObscured.value;
                        },
                      )
                    : field.hasError
                        ? IconButton(
                            icon: SermanosIcons.errorFilled(
                              status: SermanosIconStatus.error,
                            ),
                            onPressed: () {
                              if (!isEmpty) {
                                controller.clear();
                                field.reset();
                              }
                            },
                          )
                        : isEmpty
                            ? null
                            : IconButton(
                                icon: SermanosIcons.close(
                                  status: SermanosIconStatus.activated,
                                ),
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
    );
  }
}
