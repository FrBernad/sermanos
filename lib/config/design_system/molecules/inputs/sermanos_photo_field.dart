import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sermanos/config/design_system/cellules/modals/sermanos_dialog.dart';
import 'package:sermanos/config/design_system/molecules/buttons/sermanos_CTA_button.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';
import 'package:sermanos/features/core/providers.dart';

class SermanosPhotoField extends HookConsumerWidget {
  const SermanosPhotoField({
    Key? key,
    required this.formField,
    required this.initialValue,
    this.enabled = true,
    this.validators,
  }) : super(key: key);

  final String formField;
  final String initialValue;
  final bool enabled;

  final List<String? Function(String?)>? validators;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FormBuilderField<String>(
      initialValue: initialValue,
      name: formField,
      validator: FormBuilderValidators.compose(validators ?? []),
      builder: (FormFieldState field) {
        return SermanosCTAButton(
          text: "Subir foto",
          onPressed: () => _onPressedProfileButton(context, ref, field),
          filled: true,
        );
      },
    );
  }

  _onPressedProfileButton(
      BuildContext context, WidgetRef ref, FormFieldState field) async {
    var permission = await ref.read(galleryPermissionProvider.future);
    if (context.mounted) {
      if (permission.isDenied) {
        await _showPermissionGalleryDialog(context);
        permission = await Permission.photos.request();
        if (!permission.isDenied) {
          ref.invalidate(galleryPermissionProvider);
        }
      }
    }
    if (permission.isPermanentlyDenied) {
      if (context.mounted) {
        await _showPermanentlyDeniedPermissionDialog(context);
      }
    } else if (permission.isGranted) {
      if (context.mounted) {
        final ImagePicker picker = ImagePicker();
        final XFile? image =
            await picker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          field.didChange(image.path);
        }
        print("hola");
      }
    } else {
      if (context.mounted) {
        await _showPermissionGalleryDialog(context);
      }
    }
  }

  _showPermissionGalleryDialog(BuildContext context) async {
    return await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => SermanosDialog(
        title: "Acceso a galería",
        content:
            "Sermanos solicita el acceso a la galería para seleccionar la foto de perfil.",
        actions: [
          SermanosCTAButton(
            filled: false,
            onPressed: () async {
              Navigator.of(context).pop();
            },
            textColor: SermanosColors.primary100,
            text: "Ok".toUpperCase(),
          ),
        ],
      ),
    );
  }

  _showPermanentlyDeniedPermissionDialog(BuildContext context) async {
    return await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => SermanosDialog(
        title: "Acceso a galería",
        content:
            "Para poder acceder a tu galería es necesario que brindes permiso a la aplicación desde la configuración de su dispositivo ",
        actions: [
          SermanosCTAButton(
              filled: false,
              onPressed: () async => await openAppSettings(),
              textColor: SermanosColors.primary100,
              text: "Configuración".toUpperCase()),
          SermanosCTAButton(
            filled: false,
            onPressed: () => Navigator.of(context).pop(),
            textColor: SermanosColors.primary100,
            text: "Ok".toUpperCase(),
          ),
        ],
      ),
    );
  }
}
