import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/widgets/selectable_container.dart';

class ShowSelectFormColumn extends StatelessWidget {
  final Widget formContainer;
  final void Function()? onTapContainer;
  final void Function() onTick;
  final String subtitle;
  final bool isTick;
  final bool isVisibleForm;
  const ShowSelectFormColumn(
      {super.key,
      required this.formContainer,
      this.onTapContainer,
      required this.onTick,
      required this.subtitle,
      required this.isTick,
      this.isVisibleForm = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTapContainer,
          child: SelectableContainer(
            onTick: onTick,
            text: subtitle,
            isTick: isTick,
          ),
        ),
        SizedBox(
          height: height10,
        ),
        Entry.all(
          opacity: 1,
          visible: isVisibleForm,
          yOffset: -150,
          child: formContainer,
        )
      ],
    );
  }
}
