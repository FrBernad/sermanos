import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sermanos/config/design_system/atoms/icons/sermanos_icons.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_typography.dart';
import 'package:sermanos/features/user/domain/models/gender.dart';

class SermanosRadioGroup<T> extends StatefulWidget {
  const SermanosRadioGroup({
    Key? key,
    // required this.formField,
    // required this.initialValue,
    // this.enabled = true,
    // this.validators,
    required this.values,
    required this.labels,
  }) : super(key: key);

  final List<T> values;

  final List<String> labels;

  // final String formField;
  // final int? initialValue;
  // final bool enabled;

  @override
  State<SermanosRadioGroup<T>> createState() => _SermanosRadioGroupState<T>();
}

class _SermanosRadioGroupState<T> extends State<SermanosRadioGroup<T>> {
  T? _gender;
  int? _selectedIdx;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: 'gender',
      builder: (FormFieldState field) {
        return ListView.builder(
          padding: EdgeInsets.all(0),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.values.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: InkWell(
                    child: SermanosIcons.check(
                      status: SermanosIconStatus.activated,
                      checked: _selectedIdx == index,
                    ),
                    onTap: () {
                      setState(() {
                        _gender = widget.values[index];
                        _selectedIdx = index;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.labels[index],
                  style: const SermanosTypography.body01(),
                )
              ],
            );
          },
        );
      },
    );
  }
}
