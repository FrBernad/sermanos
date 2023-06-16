import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sermanos/features/user/application/update_user_data_controller.dart';
import 'package:sermanos/features/user/domain/models/gender.dart';
import 'package:sermanos/features/user/domain/models/user_data_dto.dart';
import 'package:sermanos/features/user/presentation/screens/form_modal_screen.dart';

import '../../../../../config/design_system/molecules/buttons/sermanos_CTA_button.dart';
import '../../../../../config/providers.dart';

class SaveDataButton extends ConsumerWidget {
  const SaveDataButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLoading = false;

    ref.watch(updateUserDataControllerProvider).maybeWhen(
          loading: () => isLoading = true,
          orElse: () {},
        );

    return SermanosCTAButton(
      text: 'Guardar datos',
      onPressed: () => _onPressed(ref, context),
      loading: isLoading,
      filled: true,
    );
  }

  void _onPressed(WidgetRef ref, BuildContext context) async {
    if (!profileFormKey.currentState!.validate()) {
      return;
    }

    final DateTime birthdate = DateFormat('dd/MM/yyyy')
        .parse(profileFormKey.currentState!.fields['birthdate']!.value);
    final String phone =
        profileFormKey.currentState!.fields['telephone']!.value;
    final Gender gender = profileFormKey.currentState!.fields['gender']!.value;
    final String emailContact =
        profileFormKey.currentState!.fields['emailContact']!.value;

    final String profileImagePath =
        profileFormKey.currentState!.fields['profileImage']!.value;

    File? profileImageFile;
    if (profileImagePath !=
        profileFormKey.currentState!.fields['profileImage']!.initialValue) {
      profileImageFile = File(profileImagePath);
    }

    final UserDataDto userData = UserDataDto(
      phone: phone,
      gender: gender,
      birthdate: birthdate,
      emailContact: emailContact,
      profileImage: profileImageFile,
    );
    final success = await ref
        .read(updateUserDataControllerProvider.notifier)
        .updateUser(userData: userData);
    if (success) {
      await ref
          .read(firebaseAnalyticsProvider)
          .logEvent(name: "profile_completion");
      if (context.mounted) {
        Navigator.of(context).pop(true);
      }
    }
  }
}
