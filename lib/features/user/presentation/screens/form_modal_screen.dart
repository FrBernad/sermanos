import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sermanos/config/design_system/atoms/icons/sermanos_icons.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_typography.dart';
import 'package:sermanos/features/user/application/update_user_data_controller.dart';
import 'package:sermanos/features/user/domain/models/app_user_model.dart';
import 'package:sermanos/features/user/presentation/widgets/form/contact_data_form.dart';
import 'package:sermanos/features/user/presentation/widgets/form/profile_data_form.dart';
import 'package:sermanos/features/user/presentation/widgets/form/save_data_button.dart';

final profileFormKey = GlobalKey<FormBuilderState>();

class ProfileFormModalScreen extends ConsumerWidget {
  final AppUser user;

  const ProfileFormModalScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? errorText;

    ref.watch(updateUserDataControllerProvider).maybeWhen(
          error: (error, __) {
            errorText = error.toString();
          },
          orElse: () {},
        );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: SermanosColors.neutral0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(false),
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
          key: profileFormKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileDataForm(
                  user: user,
                  genderField: 'gender',
                  birthdateField: 'birthdate',
                  imageField: 'profileImage',
                ),
                const SizedBox(
                  height: 32,
                ),
                ContactDataForm(
                  user: user,
                  telephoneField: 'telephone',
                  emailContactField: 'emailContact',
                ),
                const SizedBox(
                  height: 32,
                ),
                const SaveDataButton(),
                if (errorText != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 8.0),
                    child: Text(
                      errorText!,
                      textAlign: TextAlign.start,
                      style: const SermanosTypography.body01(
                        color: SermanosColors.error100,
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
