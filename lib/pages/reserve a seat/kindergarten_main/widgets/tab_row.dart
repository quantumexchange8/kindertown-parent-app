import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class TabRow extends StatelessWidget {
  final List<String> tabList;
  final int activeIndex;
  final void Function(int tabIndex) onTabTap;
  const TabRow(
      {super.key,
      required this.tabList,
      required this.activeIndex,
      required this.onTabTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: tabList
          .mapIndexed((i, e) => Padding(
                padding: EdgeInsets.only(
                    right: isLast(i, tabList.length) ? 0 : width24 / 2),
                child: InkWell(
                  onTap: () {
                    onTabTap(i);
                  },
                  child: _tabContainer(
                      isSelected: i == activeIndex,
                      index: i,
                      listLength: tabList.length,
                      tabName: e),
                ),
              ))
          .toList(),
    );
  }
}

Container _tabContainer(
    {required int index,
    required int listLength,
    required String tabName,
    required bool isSelected}) {
  BorderRadiusGeometry borderRadius = const BorderRadius.all(
    Radius.circular(20),
  );

  if (index == 0) {
    borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(100),
      topRight: Radius.circular(20),
      bottomLeft: Radius.circular(20),
      bottomRight: Radius.circular(20),
    );
  } else if (index == (listLength - 1)) {
    borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(100),
      bottomLeft: Radius.circular(20),
      bottomRight: Radius.circular(20),
    );
  }

  return Container(
    width: width100 * 1.2,
    height: height30,
    decoration: ShapeDecoration(
      color: isSelected ? yellowPrimary : const Color(0xFFE0E0E0),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      shadows: const [
        BoxShadow(
          color: Color(0x3F000000),
          blurRadius: 4,
          offset: Offset(0, 2),
          spreadRadius: 0,
        )
      ],
    ),
    child: Center(
      child: Text(
        tabName,
        style: textSm.copyWith(
            color: isSelected ? purplePrimary : const Color(0xFFBBBBBB),
            fontWeight: FontWeight.w700),
      ),
    ),
  );
}
