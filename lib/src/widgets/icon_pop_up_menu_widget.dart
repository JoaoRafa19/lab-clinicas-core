import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class IconPopUpMenuWidget extends StatelessWidget {
  const IconPopUpMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 64.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: LabClinicasTheme.orangeColor,
            width: 2,
          ),
        ),
        child: const Icon(
          Icons.more_horiz_rounded,
          color: LabClinicasTheme.orangeColor,
        ),
      ),
    );
  }
}
