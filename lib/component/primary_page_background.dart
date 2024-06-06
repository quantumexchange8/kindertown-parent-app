import 'package:flutter/material.dart';

class PrimaryPageBackground extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  final BoxFit? fit;
  final Widget? child;
  const PrimaryPageBackground(
      {super.key,
      this.padding,
      this.backgroundColor,
      this.border,
      this.borderRadius,
      this.fit,
      this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
          border: border,
          image: DecorationImage(
              image: const AssetImage('assets/images/main_background.png'),
              fit: fit)),
      child: child,
    );
  }
}
