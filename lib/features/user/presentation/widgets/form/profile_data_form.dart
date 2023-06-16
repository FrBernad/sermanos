import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:sermanos/config/design_system/molecules/inputs/sermanos_date_field.dart';
import 'package:sermanos/config/design_system/molecules/inputs/sermanos_photo_field.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_typography.dart';
import 'package:sermanos/features/user/application/update_user_data_controller.dart';
import 'package:sermanos/features/user/domain/models/app_user_model.dart';
import 'package:sermanos/features/user/domain/models/gender.dart';
import 'package:sermanos/config/design_system/molecules/inputs/sermanos_radio_group.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';

class ProfileDataForm extends ConsumerWidget {
  final AppUser user;
  final String genderField;
  final String birthdateField;
  final String imageField;

  const ProfileDataForm({
    Key? key,
    required this.user,
    required this.genderField,
    required this.birthdateField,
    required this.imageField,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actualDate = DateTime.now();
    final minDate =
        DateTime(actualDate.year - 100, actualDate.month, actualDate.day);
    bool enabled = true;

    ref.watch(updateUserDataControllerProvider).maybeWhen(
          loading: () => enabled = false,
          orElse: () {},
        );

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Datos de perfil",
            style: SermanosTypography.headline01(
              color: SermanosColors.neutral100,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SermanosDateField(
            minDate: minDate,
            maxDate: actualDate,
            actualDate: actualDate,
            formField: birthdateField,
            initialDate: user.birthdate,
            enabled: enabled,
            validators: [
              FormBuilderValidators.required(
                  errorText: "Ingrese su fecha de nacimiento"),
              FormBuilderValidators.match(
                  r"^([0-2][0-9]|(3)[0-1])(\/)(((0)[0-9])|((1)[0-2]))(\/)\d{4}$",
                  errorText:
                      "Ingrese una fecha válida con el formato DD/MM/YYYY"),
              (value) {
                try {
                  if (value != null) {
                    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
                    DateTime birthdate = dateFormat.parse(value);
                    DateTime currentDate =
                        dateFormat.parse(dateFormat.format(actualDate));
                    if (birthdate.isAfter(currentDate)) {
                      return "Ingrese una fecha válida";
                    }
                    if (birthdate.isBefore(minDate)) {
                      return "Ingrese una fecha válida";
                    }
                  }
                } on Exception {
                  return "Ingrese una fecha válida";
                }
                return null;
              }
            ],
            label: 'Fecha de nacimiento',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            placeholder: 'DD/MM/YYYY',
          ),
          const SizedBox(
            height: 24,
          ),
          Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4),
                    topLeft: Radius.circular(4),
                  ),
                  color: SermanosColors.secondary25,
                ),
                width: double.infinity,
                child: const Text(
                  "Información del perfil",
                  style: SermanosTypography.subtitle01(
                      color: SermanosColors.neutral100),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(4),
                      bottomLeft: Radius.circular(4)),
                  color: SermanosColors.neutral10,
                ),
                width: double.infinity,
                child: SermanosRadioGroup<Gender>(
                  initialValue: user.gender,
                  enabled: enabled,
                  formField: genderField,
                  labels: Gender.values.map((g) => g.text).toList(),
                  values: Gender.values,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: SermanosColors.secondary25,
            ),
            width: double.infinity,
            child: SermanosPhotoField(
              enabled: enabled,
              initialValue: user.profileImageUrl,
              formField: imageField,
            ),
          ),
        ],
      ),
    );
  }
}
