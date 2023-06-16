import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_typography.dart';

class SermanosRadioGroup<T> extends StatefulWidget {
  const SermanosRadioGroup({
    Key? key,
    required this.formField,
    required this.initialValue,
    this.enabled = true,
    required this.values,
    required this.labels,
  }) : super(key: key);

  final List<T> values;
  final List<String> labels;
  final String formField;
  final T? initialValue;
  final bool enabled;

  @override
  State<SermanosRadioGroup<T>> createState() => _SermanosRadioGroupState<T>();
}

class _SermanosRadioGroupState<T> extends State<SermanosRadioGroup<T>> {
  T? _gender;

  @override
  void initState() {
    super.initState();
    _gender = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<T>(
      initialValue: widget.initialValue,
      onChanged: (val) => debugPrint(val.toString()),
      validator: (valueCandidate) {
        if (_gender == null && valueCandidate == null) {
          return 'Debes seleccionar un género';
        }
        return null;
      },
      name: widget.formField,
      builder: (FormFieldState field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              padding: const EdgeInsets.all(0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.values.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        padding: const EdgeInsets.all(2),
                        child: Radio(
                          value: widget.values[index],
                          fillColor: MaterialStateColor.resolveWith((states) {
                            if (widget.enabled) {
                              return SermanosColors.primary100;
                            }
                            return SermanosColors.neutral50;
                          }),
                          groupValue: _gender,
                          onChanged: !widget.enabled
                              ? null
                              : (T? value) {
                                  setState(() {
                                    _gender = value;
                                    field.didChange(value);
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
                  ),
                );
              },
            ),
            if (field.errorText != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                child: Text(
                  field.errorText!,
                  textAlign: TextAlign.start,
                  style: const SermanosTypography.body01(
                      color: SermanosColors.error100),
                ),
              )
          ],
        );
      },
    );
  }
}
