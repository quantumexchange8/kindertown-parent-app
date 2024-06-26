import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';

class NavigationBottomBarShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double topCornerRadius = 20;
    const double bottomCornerRadius = 60;
    final double arcHeight = height10 * 7;
    final double arcWidth = width100 * 1.2;

    final path = Path();

    // Start from top-left corner
    path.moveTo(topCornerRadius, 0);

    // Top edge
    path.lineTo(size.width / 2 - arcWidth / 2, 0);
    path.quadraticBezierTo(
        size.width / 2, -arcHeight, size.width / 2 + arcWidth / 2, 0);
    path.lineTo(size.width - topCornerRadius, 0);

    // Top-right corner
    path.arcToPoint(
      Offset(size.width, topCornerRadius),
      radius: Radius.circular(topCornerRadius),
    );

    // Right edge
    path.lineTo(size.width, size.height - bottomCornerRadius);

    // Bottom-right corner
    path.arcToPoint(
      Offset(size.width - bottomCornerRadius, size.height),
      radius: Radius.circular(bottomCornerRadius),
    );

    // Bottom edge
    path.lineTo(bottomCornerRadius, size.height);

    // Bottom-left corner
    path.arcToPoint(
      Offset(0, size.height - bottomCornerRadius),
      radius: Radius.circular(bottomCornerRadius),
    );

    // Left edge
    path.lineTo(0, topCornerRadius);

    // Top-left corner
    path.arcToPoint(
      Offset(topCornerRadius, 0),
      radius: Radius.circular(topCornerRadius),
    );

    canvas.drawShadow(path, Colors.black, 4, false);

    final paint = Paint()
      ..color = yellowPrimary
      ..style = PaintingStyle.fill;
    // Draw the path
    canvas.drawPath(path, paint);

    // Draw the red border
    final redBorderPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    canvas.drawPath(path, redBorderPaint);

    // Optional: Draw the white dashed border inside the red border
    final borderPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    // Create a dashed border effect
    final insetPath = Path();
    final inset = 8.0;
    insetPath.moveTo(topCornerRadius + inset, inset);

    insetPath.lineTo(size.width / 2 - arcWidth / 2, inset);
    insetPath.quadraticBezierTo(size.width / 2, -arcHeight + inset,
        size.width / 2 + arcWidth / 2, inset);
    insetPath.lineTo(size.width - topCornerRadius - inset, inset);

    insetPath.arcToPoint(
      Offset(size.width - inset, topCornerRadius + inset),
      radius: Radius.circular(topCornerRadius),
    );

    insetPath.lineTo(
        size.width - inset, size.height - bottomCornerRadius - inset);

    insetPath.arcToPoint(
      Offset(size.width - bottomCornerRadius - inset, size.height - inset),
      radius: Radius.circular(bottomCornerRadius),
    );

    insetPath.lineTo(bottomCornerRadius + inset, size.height - inset);

    insetPath.arcToPoint(
      Offset(inset, size.height - bottomCornerRadius - inset),
      radius: Radius.circular(bottomCornerRadius),
    );

    insetPath.lineTo(inset, topCornerRadius + inset);

    insetPath.arcToPoint(
      Offset(topCornerRadius + inset, inset),
      radius: Radius.circular(topCornerRadius),
    );

    double dashWidth = 6;
    double dashSpace = 6;
    double distance = 0;

    for (PathMetric pathMetric in insetPath.computeMetrics()) {
      while (distance < pathMetric.length) {
        canvas.drawPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          borderPaint,
        );
        distance += dashWidth + dashSpace;
      }
      distance = 0;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
