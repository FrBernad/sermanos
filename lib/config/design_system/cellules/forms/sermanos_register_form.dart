import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../molecules/inputs/sermanos_text_field.dart';

final _registerFormKey = GlobalKey<FormBuilderState>();

class SermanosRegisterForm extends StatelessWidget {
  const SermanosRegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _registerFormKey,
      child: Column(
        children: const [
          SermanosTextField(
            formField: 'name',
            initialValue: '',
            label: 'Email',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            placeholder: 'Ej: Juan',
          ),
          SizedBox(height: 24),
          SermanosTextField(
            formField: 'surname',
            initialValue: '',
            label: 'Apellido',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            placeholder: 'Ej: Barcena',
          ),
          SizedBox(height: 24),
          SermanosTextField(
            formField: 'email',
            initialValue: '',
            label: 'Email',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            placeholder: 'Ej: juanbarcena@gmail.com',
          ),
          SizedBox(height: 24),
          SermanosTextField(
            formField: 'password',
            initialValue: '',
            label: 'Contraseña',
            password: true,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            placeholder: 'Ej: ABCD1234',
          ),
        ],
      ),
    );
  }
}
