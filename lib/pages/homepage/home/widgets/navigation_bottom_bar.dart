import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/navigation_bottom_bar_shape.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class NavigationBottomBar extends StatelessWidget {
  final double cornerRadius;
  final double arcRadius;
  final double arcHeight;
  final double arcWidth;
  final int currentIndex;
  final void Function(int newIndex) onTapItem;
  const NavigationBottomBar({
    super.key,
    required this.cornerRadius,
    required this.arcRadius,
    required this.arcHeight,
    required this.arcWidth,
    required this.currentIndex,
    required this.onTapItem,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      height: height100 * 1.2,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(screenWidth, height100 * 1.2),
            painter: NavigationBottomBarShape(
              cornerRadius: cornerRadius,
              arcRadius: arcRadius,
              arcHeight: arcHeight,
              arcWidth: arcWidth,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width30),
            child: Row(
              children: [
                _defaultIconColumn(
                    onTap: () {
                      onTapItem(0);
                    },
                    isActive: currentIndex == 0,
                    activeIconAddress: 'assets/icons/bottom_bar/.png',
                    iconAddress: 'assets/icons/bottom_bar/.png',
                    title: 'Notice'),
                SizedBox(
                  width: width10 * 4.4,
                ),
                _defaultIconColumn(
                    onTap: () {
                      onTapItem(1);
                    },
                    isActive: currentIndex == 1,
                    activeIconAddress: 'assets/icons/bottom_bar/.png',
                    iconAddress: 'assets/icons/bottom_bar/.png',
                    title: 'Academic'),
                Padding(
                  padding: EdgeInsets.only(bottom: height08 / 2),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width10 * 4.4),
                    child: _middleIconColumn(
                      onTap: () {
                        onTapItem(2);
                      },
                      isActive: currentIndex == 2,
                    ),
                  ),
                ),
                _defaultIconColumn(
                    onTap: () {
                      onTapItem(3);
                    },
                    isActive: currentIndex == 3,
                    activeIconAddress: 'assets/icons/bottom_bar/.png',
                    iconAddress: 'assets/icons/bottom_bar/.png',
                    title: 'Payment'),
                SizedBox(
                  width: width10 * 4.4,
                ),
                _defaultIconColumn(
                    onTap: () {
                      onTapItem(4);
                    },
                    isActive: currentIndex == 4,
                    activeIconAddress: 'assets/icons/bottom_bar/.png',
                    iconAddress: 'assets/icons/bottom_bar/.png',
                    title: 'Profile'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _defaultIconColumn({
  void Function()? onTap,
  required bool isActive,
  required String iconAddress,
  required String activeIconAddress,
  required String title,
}) {
  return InkWell(
    onTap: onTap,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          isActive ? activeIconAddress : iconAddress,
          height: height10 * 3.6,
          fit: BoxFit.fitHeight,
        ),
        SizedBox(height: height08 / 2),
        Text(
          title,
          textAlign: TextAlign.center,
          style: textXXS.copyWith(
            color: isActive ? orangePrimary : purplePrimary,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  );
}

Widget _middleIconColumn({void Function()? onTap, required bool isActive}) {
  return InkWell(
    onTap: onTap,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/icons/bottom_bar/home_${isActive ? 'active' : 'default'}.png',
          height: height10 * 5.2,
          fit: BoxFit.fitHeight,
        ),
        SizedBox(height: height05),
        Text(
          'Home',
          textAlign: TextAlign.center,
          style: textXS.copyWith(
            color: orangePrimary,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  );
}
