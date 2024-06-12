import 'package:collection/collection.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_textfield.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class PrimaryDropdownTextfield extends StatelessWidget {
  final FocusNode focusNode;
  final List<String> items;
  final String selectedItem;
  final void Function(String item) onTapItem;
  const PrimaryDropdownTextfield(
      {super.key,
      required this.focusNode,
      required this.items,
      required this.selectedItem,
      required this.onTapItem});

  @override
  Widget build(BuildContext context) {
    final isFocus = focusNode.hasFocus;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PrimaryTextfield(
          readOnly: true,
          focusNode: focusNode,
          controller: TextEditingController(text: selectedItem),
          suffixIcon: Container(
            padding: EdgeInsets.all(height08 / 2),
            decoration: const BoxDecoration(
                color: yellowPrimary, shape: BoxShape.circle),
            child: Icon(
              isFocus
                  ? Icons.keyboard_arrow_up_rounded
                  : Icons.keyboard_arrow_down_rounded,
              color: Colors.white,
              size: height24 / 2,
            ),
          ),
        ),
        if (isFocus)
          _itemsContainer(
              onTapItem: onTapItem, items: items, selectedItem: selectedItem)
      ],
    );
  }
}

Widget _itemsContainer(
    {required List<String> items,
    required String selectedItem,
    required void Function(String item) onTapItem}) {
  return Stack(
    children: [
      Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: items.mapIndexed((i, e) {
              final isLasted = isLast(i, items.length);
              final isFirst = i == 0;
              final isSelected = selectedItem == e;

              return InkWell(
                onTap: () {
                  onTapItem(e);
                },
                child: Container(
                  color:
                      isSelected ? const Color(0xFFFFEFD2) : Colors.transparent,
                  padding: EdgeInsets.symmetric(
                      vertical: height08, horizontal: width20 * 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                    topLeft: isFirst ? const Radius.circular(10) : Radius.zero,
                    topRight: isFirst ? const Radius.circular(10) : Radius.zero,
                    bottomLeft:
                        isLasted ? const Radius.circular(10) : Radius.zero,
                    bottomRight:
                        isLasted ? const Radius.circular(10) : Radius.zero,
                  )),
                  child: Text(
                    e,
                    style: textMd.copyWith(
                      fontSize: height10 * 1.8,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            }).toList()),
      ),
      DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 3,
        color: orangePrimary,
        radius: const Radius.circular(10),
        child: Container(),
      )
    ],
  );
}
