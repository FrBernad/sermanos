import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../molecules/inputs/sermanos_text_field.dart';

final _loginFormKey = GlobalKey<FormBuilderState>();

class SermanosLoginForm extends StatelessWidget {
  const SermanosLoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _loginFormKey,
      child: Column(
        children: const [
          SermanosTextField(
            formField: 'email',
            initialValue: '',
            label: 'Email',
          ),
          SizedBox(height: 24),
          SermanosTextField(
            formField: 'password',
            initialValue: '',
            label: 'Contraseña',
          ),
        ],
      ),
    );
  }
}
