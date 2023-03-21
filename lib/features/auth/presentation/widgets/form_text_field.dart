import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../config/theme/app_text_styles.dart';

class FormTextField extends HookConsumerWidget {
  const FormTextField({
    Key? key,
    required this.formField,
    required this.initialValue,
    this.enabled = true,
    this.password = false,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.label,
    this.placeholder,
    this.validators,
  }) : super(key: key);

  final String formField;
  final String initialValue;
  final bool enabled;
  final bool password;
  final FloatingLabelBehavior floatingLabelBehavior;
  final String? label;
  final String? placeholder;
  final List<String? Function(String?)>? validators;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNode = useFocusNode();
    useListenable(focusNode);

    final controller = useTextEditingController(text: initialValue);

    final bool isEmpty =
        useListenableSelector(controller, () => controller.text.isEmpty);

    final isObscured = useState(password);

    return FormBuilderField<String>(
      initialValue: initialValue,
      name: formField,
      onReset: () => controller.text = initialValue,
      validator: FormBuilderValidators.compose(validators ?? []),
      builder: (FormFieldState field) {
        return TextField(
          obscureText: isObscured.value,
          enabled: enabled,
          focusNode: focusNode,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            hintText: placeholder,
            hintStyle: AppTextStyles.subtitle01.copyWith(
              color: enabled ? AppColors.neutral50 : AppColors.neutral25,
            ),
            labelText: label,
            labelStyle: AppTextStyles.subtitle01.copyWith(
              color: enabled
                  ? focusNode.hasFocus
                      ? AppColors.secondary200
                      : AppColors.neutral75
                  : AppColors.neutral50,
            ),
            floatingLabelBehavior: floatingLabelBehavior,
            floatingLabelStyle: AppTextStyles.caption.copyWith(
              color: enabled
                  ? focusNode.hasFocus
                      ? AppColors.secondary200
                      : AppColors.neutral75
                  : AppColors.neutral50,
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: AppColors.neutral50,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: AppColors.secondary200,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: AppColors.neutral75,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: AppColors.error100,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            errorStyle: AppTextStyles.body01.copyWith(
              color: AppColors.error100,
            ),
            suffixIcon: password
                ? IconButton(
                    icon: Icon(
                      isObscured.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      size: 24,
                      color: AppColors.neutral75,
                    ),
                    onPressed: () {
                      isObscured.value = !isObscured.value;
                    },
                  )
                : field.hasError
                    ? IconButton(
                        icon: const Icon(
                          Icons.error,
                          size: 24,
                          color: AppColors.error100,
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
                            icon: const Icon(
                              Icons.close,
                              size: 24,
                              color: AppColors.neutral75,
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
