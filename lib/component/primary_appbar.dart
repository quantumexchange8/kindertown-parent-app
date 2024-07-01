import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/back_button.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';

PreferredSizeWidget primaryAppbar({
  Widget? leading,
  bool showBackButton = true,
  bool isTransparent = false,
  Widget? title,
  List<Widget> actions = const <Widget>[],
}) {
  return PreferredSize(
    preferredSize: Size(screenWidth, height100 * 4.3),
    child: Container(
      padding: EdgeInsets.fromLTRB(width24 / 2, 0, width24 / 2, height10 * 1.8),
      decoration: BoxDecoration(
          image: isTransparent
              ? null
              : const DecorationImage(
                  alignment: Alignment.bottomCenter,
                  image: AssetImage('assets/images/header_background.png'),
                  fit: BoxFit.fitWidth),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25))),
      child: SafeArea(
          child: SizedBox(
        height: height10 * 5,
        child: Row(
          children: [
            if (showBackButton)
              Padding(
                padding: EdgeInsets.only(left: width08 * 2),
                child: leading ??
                    PrimaryBackButton(
                      size: height24,
                    ),
              ),
            if (title != null) Expanded(flex: 8, child: title),
            Expanded(
                child: Row(
              mainAxisSize: MainAxisSize.min,
              children: actions,
            ))
          ],
        ),
      )),
    ),
  );
}
