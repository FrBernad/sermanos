import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sermanos/config/design_system/cellules/modals/sermanos_permission_modal.dart';
import 'package:sermanos/config/design_system/molecules/buttons/sermanos_short_button.dart';
import 'package:sermanos/config/design_system/molecules/components/profile_image.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_typography.dart';
import 'package:sermanos/features/core/providers.dart';

class SermanosPhotoField extends ConsumerStatefulWidget {
  const SermanosPhotoField({
    Key? key,
    required this.formField,
    required this.initialValue,
    this.enabled = true,
    this.validators,
  }) : super(key: key);

  final String formField;
  final String? initialValue;
  final bool enabled;

  final List<String? Function(String?)>? validators;

  @override
  ConsumerState<SermanosPhotoField> createState() => _SermanosPhotoFieldState();
}

class _SermanosPhotoFieldState extends ConsumerState<SermanosPhotoField> {
  String? _image;

  @override
  void initState() {
    super.initState();
    _image = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      initialValue: widget.initialValue,
      name: widget.formField,
      validator: FormBuilderValidators.compose(widget.validators ?? []),
      builder: (FormFieldState field) {
        return _image == null
            ? Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Foto de perfil",
                      style: SermanosTypography.subtitle01(
                          color: SermanosColors.neutral100),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  SermanosShortButton(
                    text: "Subir foto",
                    onPressed: () =>
                        _onPressedProfileButton(context, ref, field),
                    filled: true,
                    enabled: widget.enabled,
                  )
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Foto de perfil",
                        style: SermanosTypography.subtitle01(
                            color: SermanosColors.neutral100),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SermanosShortButton(
                        text: "Cambiar foto",
                        onPressed: () =>
                            _onPressedProfileButton(context, ref, field),
                        filled: true,
                        enabled: widget.enabled,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  ProfileImage(
                    imageUrl: _image,
                    height: 84,
                    width: 84,
                    fromNetwork: _image == widget.initialValue,
                  )
                ],
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
          setState(() {
            _image = image.path;
          });
        }
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
      builder: (context) => SermanosPermissionModal(
        title: "Acceso a galería",
        content:
            "Sermanos solicita el acceso a la galería para seleccionar la foto de perfil.",
        actions: [
          SermanosShortButton(
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
      builder: (context) => SermanosPermissionModal(
        title: "Acceso a galería",
        content:
            "Para poder acceder a tu galería es necesario que brindes permiso a la aplicación desde la configuración de su dispositivo ",
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SermanosShortButton(
                filled: false,
                onPressed: () async {
                  Navigator.of(context).pop();
                  await openAppSettings();
                },
                textColor: SermanosColors.primary100,
                text: "Configuración".toUpperCase(),
              ),
              SermanosShortButton(
                filled: false,
                onPressed: () => Navigator.of(context).pop(),
                textColor: SermanosColors.primary100,
                text: "Ok".toUpperCase(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
