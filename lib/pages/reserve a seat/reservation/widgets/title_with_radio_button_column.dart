import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_tickbox.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class TitleWithRadioButtonColumn extends StatelessWidget {
  final void Function(String item) onTick;
  final String title;
  final List<String> items;
  final String? selectedItem;
  const TitleWithRadioButtonColumn(
      {super.key,
      required this.title,
      required this.items,
      required this.selectedItem,
      required this.onTick});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textLg.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: height15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items
              .map((e) => Expanded(
                    child: _itemRow(
                        onTick: () {
                          onTick(e);
                        },
                        item: e,
                        selectedItem: selectedItem),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

Row _itemRow({
  void Function()? onTick,
  required String item,
  required String? selectedItem,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      PrimaryTickBox(
        onTick: onTick,
        isTick: item == selectedItem,
      ),
      SizedBox(width: width10 * 2.7),
      Text(
        item,
        style: textLg.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
    ],
  );
}
