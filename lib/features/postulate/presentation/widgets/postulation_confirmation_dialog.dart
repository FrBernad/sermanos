import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../config/design_system/tokens/sermanos_colors.dart';
import '../../../../config/design_system/tokens/sermanos_typography.dart';

class PostulationConfirmationDialog extends StatelessWidget {
  const PostulationConfirmationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        child: Container(
          width: 280,
          padding: const EdgeInsets.fromLTRB(16, 16, 8, 16),
          decoration: BoxDecoration(
            color: SermanosColors.neutral0,
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(0, 4), // changes position of shadow
                blurRadius: 4,
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                offset: const Offset(0, 8), // changes position of shadow
                blurRadius: 12,
                spreadRadius: 6,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Te estas por postular a',
                    style: SermanosTypography.subtitle01,
                  ),
                  const Text(
                    'Un Techo para mi País',
                    style: SermanosTypography.headline02,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Días sábados de 9.00 a 17.00 horas.',
                    style: SermanosTypography.body01.copyWith(
                      color: SermanosColors.neutral75,
                    ),
                  ),
                  Text(
                    'Caballito',
                    style: SermanosTypography.body01.copyWith(
                      color: SermanosColors.neutral75,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 8,
                        ),
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text(
                      'Cancelar',
                      style: SermanosTypography.button.copyWith(
                        color: SermanosColors.primary100,
                      ),
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 8,
                        ),
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text(
                      'Confirmar',
                      style: SermanosTypography.button.copyWith(
                        color: SermanosColors.primary100,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
