import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sermanos/config/design_system/molecules/inputs/sermanos_text_field.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_typography.dart';
import 'package:sermanos/features/user/domain/models/app_user_model.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';

class ContactDataForm extends StatelessWidget {
  final AppUser user;
  final String emailContactField;
  final String telephoneField;

  const ContactDataForm({
    Key? key,
    required this.user,
    required this.emailContactField,
    required this.telephoneField,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Datos de contacto",
          style: SermanosTypography.headline01(
            color: SermanosColors.neutral100,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        const Text(
          "Estos datos serán compartidos con la organización para ponerse en contacto contigo",
          style: SermanosTypography.subtitle01(
            color: SermanosColors.neutral100,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        SermanosTextField(
          formField: telephoneField,
          initialValue: user.phone,
          keyboardType: TextInputType.phone,
          enabled: true,
          validators: [
            FormBuilderValidators.required(errorText: "Ingrese su teléfono"),
            FormBuilderValidators.match(
                r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[0-9]*$'),
          ],
          label: 'Teléfono',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          placeholder: 'Ej: +541178445459',
        ),
        const SizedBox(
          height: 24,
        ),
        SermanosTextField(
          formField: emailContactField,
          initialValue: user.emailContact,
          enabled: true,
          validators: [
            FormBuilderValidators.required(errorText: "Ingrese su mail"),
            FormBuilderValidators.email(errorText: "Ingrese un mail válido")
          ],
          label: 'Mail',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          placeholder: 'Ej: mimail@mail.com',
        ),
      ],
    );
  }
}
