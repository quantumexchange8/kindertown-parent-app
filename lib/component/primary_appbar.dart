import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';

PreferredSizeWidget primaryAppbar({
  Widget? title,
  List<Widget> actions = const <Widget>[],
}) {
  return PreferredSize(
    preferredSize: Size(screenWidth, height100 * 4.3),
    child: Container(
      padding: EdgeInsets.fromLTRB(width24 / 2, 0, width24 / 2, height20),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/header_background.png')),
          color: yellowPrimary,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25))),
      child: SafeArea(
          child: Row(
        children: [
          const BackButton(),
          if (title != null) Expanded(flex: 3, child: title),
          Expanded(
              child: Row(
            children: actions,
          ))
        ],
      )),
    ),
  );
}
