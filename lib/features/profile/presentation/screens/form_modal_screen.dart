import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sermanos/config/design_system/atoms/icons/sermanos_icons.dart';
import 'package:sermanos/config/design_system/molecules/buttons/sermanos_CTA_button.dart';
import 'package:sermanos/config/design_system/molecules/inputs/sermanos_radio_group.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_typography.dart';
import 'package:sermanos/features/user/domain/models/app_user_model.dart';
import 'package:sermanos/features/user/domain/models/gender.dart';

final _formKey = GlobalKey<FormBuilderState>();

class ProfileFormModalScreen extends ConsumerWidget {
  final AppUser user;

  const ProfileFormModalScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLoading = false;
    String? errorText;

    // ref.watch(signInControllerProvider).maybeWhen(
    //   orElse: () {},
    //   error: (error, __) => errorText = error.toString(),
    //   // FirebaseAuthErrorTranslator.translate(context, error.toString()),
    //   loading: () => isLoading = true,
    // );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: SermanosColors.neutral0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon:
              SermanosIcons.close(status: SermanosIconStatus.enabledSecondary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: 32,
        ),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                "Datos de perfil",
                style: SermanosTypography.headline01(
                  color: SermanosColors.neutral100,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
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
                      child: const SermanosRadioGroup<Gender>(labels: [
                        "Hombre",
                        "Mujer",
                        "No binario"
                      ], values: [
                        Gender.MALE,
                        Gender.FEMALE,
                        Gender.NO_BINARY
                      ]),
                    ),
                  ],
                ),
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
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: SermanosColors.secondary25,
                    ),
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: const Text(
                            "Foto de perfil",
                            style: SermanosTypography.subtitle01(
                                color: SermanosColors.neutral100),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        SermanosCTAButton(
                            text: "Subir foto",
                            onPressed: () => null,
                            filled: true),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
