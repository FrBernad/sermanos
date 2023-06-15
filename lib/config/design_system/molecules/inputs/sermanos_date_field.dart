import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_typography.dart';

import '../../atoms/icons/sermanos_icons.dart';

class SermanosDateField extends HookConsumerWidget {
  const SermanosDateField({
    Key? key,
    required this.formField,
    required this.initialValue,
    this.enabled = true,
    // this.password = false,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.label,
    this.placeholder,
    this.validators,
  }) : super(key: key);

  final String formField;
  final String initialValue;
  final bool enabled;

  // final bool password;
  final FloatingLabelBehavior floatingLabelBehavior;
  final String? label;
  final String? placeholder;
  final List<String? Function(String?)>? validators;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNode = useFocusNode();
    useListenable(focusNode);

    final controller = useTextEditingController(
      text: initialValue,
    );

    final bool isEmpty =
        useListenableSelector(controller, () => controller.text.isEmpty);

    // final isObscured = useState(password);

    return FormBuilderField<String>(
      initialValue: initialValue,
      name: formField,
      onReset: () => controller.text = initialValue,
      validator: FormBuilderValidators.compose(validators ?? []),
      builder: (FormFieldState field) {
        return TextField(
          keyboardType: TextInputType.datetime,
          inputFormatters: [LengthLimitingTextInputFormatter(10)],
          // obscureText: isObscured.value,
          enabled: enabled,
          onChanged: (value) {
            field.didChange(value);
          },
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
            errorText: field.errorText,
            suffixIcon: !enabled
                ? null
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
                    : IconButton(
                        icon: SermanosIcons.calendarFilled(
                          status: SermanosIconStatus.activated,
                        ),
                        onPressed: () {},
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