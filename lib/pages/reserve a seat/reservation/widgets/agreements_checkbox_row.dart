import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class AgreementsCheckboxRow extends StatelessWidget {
  final void Function(bool?)? onChanged;
  final bool value;
  const AgreementsCheckboxRow({super.key, this.onChanged, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: height10 * 2.8,
          height: height10 * 2.8,
          child: Transform.scale(
            scale: 1.3,
            child: Checkbox(
              onChanged: onChanged,
              value: value,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return yellowPrimary;
                } else {
                  return const Color(0xFFE0E0E0);
                }
              }),
            ),
          ),
        ),
        SizedBox(width: width08 * 2),
        Expanded(
          child: Text(
            '*By checking this box, I acknowledge and agree to all the policies and agreements mentioned above.',
            style: textSm.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
