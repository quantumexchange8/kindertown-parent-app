import 'package:collection/collection.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class PrimaryDropdownTextfield extends StatefulWidget {
  final List<String> items;
  final String? selectedItem;
  final void Function(String item) onTapItem;
  const PrimaryDropdownTextfield(
      {super.key,
      required this.items,
      required this.selectedItem,
      required this.onTapItem});

  @override
  State<PrimaryDropdownTextfield> createState() =>
      _PrimaryDropdownTextfieldState();
}

class _PrimaryDropdownTextfieldState extends State<PrimaryDropdownTextfield> {
  bool isFocus = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PopupMenuButton<String>(
            color: Colors.white,
            onOpened: () {
              setState(() {
                isFocus = true;
              });
            },
            onCanceled: () {
              setState(() {
                isFocus = false;
              });
            },
            onSelected: (value) {
              setState(() {
                isFocus = false;
              });
            },
            surfaceTintColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            constraints: const BoxConstraints(),
            position: PopupMenuPosition.under,
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                    padding: EdgeInsets.zero,
                    child: _itemsContainer(
                      items: widget.items,
                      selectedItem: widget.selectedItem,
                      onTapItem: (item) {
                        widget.onTapItem(item);
                        Navigator.pop(context);
                      },
                    )),
              ];
            },
            child: Container(
              padding: const EdgeInsets.all(1),
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  shadows: [
                    if (isFocus)
                      const BoxShadow(
                          color: orangePrimary, blurRadius: 5, spreadRadius: 1)
                  ]),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: orangePrimary),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: DottedBorder(
                    padding: EdgeInsets.symmetric(
                        horizontal: width20, vertical: height08),
                    color: isFocus ? orangePrimary : yellowPrimary,
                    strokeWidth: 3,
                    borderType: BorderType.RRect,
                    dashPattern: const [5, 5],
                    radius: const Radius.circular(25),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                              child: widget.selectedItem != null
                                  ? Text(
                                      widget.selectedItem!,
                                      style: textLg.copyWith(
                                        fontSize: height10 * 1.8,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  : null),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              color: yellowPrimary, shape: BoxShape.circle),
                          child: Icon(
                            isFocus
                                ? Icons.keyboard_arrow_up_rounded
                                : Icons.keyboard_arrow_down_rounded,
                            color: Colors.white,
                            size: height20,
                          ),
                        ),
                      ],
                    )),
              ),
            )),
      ],
    );
  }
}

Widget _itemsContainer(
    {required List<String> items,
    required String? selectedItem,
    required void Function(String item) onTapItem}) {
  return DottedBorder(
    borderType: BorderType.RRect,
    strokeWidth: 3,
    dashPattern: const [5, 5],
    color: orangePrimary,
    radius: const Radius.circular(10),
    child: Column(
        children: items.mapIndexed((i, e) {
      final isLasted = isLast(i, items.length);
      final isFirst = i == 0;
      final isSelected = selectedItem == e;

      return InkWell(
        onTap: () {
          onTapItem(e);
        },
        child: Container(
          width: double.infinity,
          padding:
              EdgeInsets.symmetric(vertical: height08, horizontal: width20 * 2),
          decoration: BoxDecoration(
              color: isSelected ? const Color(0xFFFFEFD2) : Colors.transparent,
              borderRadius: BorderRadius.only(
                topLeft: isFirst ? const Radius.circular(10) : Radius.zero,
                topRight: isFirst ? const Radius.circular(10) : Radius.zero,
                bottomLeft: isLasted ? const Radius.circular(10) : Radius.zero,
                bottomRight: isLasted ? const Radius.circular(10) : Radius.zero,
              )),
          child: Text(
            e,
            textAlign: TextAlign.center,
            style: textMd.copyWith(
              fontSize: height10 * 1.8,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }).toList()),
  );
}
