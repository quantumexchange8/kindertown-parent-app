import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';

class NavigationBottomBarShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double cornerRadius = 40;
    final double arcHeight = height10 * 4;
    final double arcWidth = width10 * 7;

    final paint = Paint()
      ..color = yellowPrimary
      ..style = PaintingStyle.fill;

    final path = Path();

    // Start from top-left corner
    path.moveTo(cornerRadius, 0);

    // Top edge
    path.lineTo(size.width / 2 - arcWidth / 2, 0);
    path.quadraticBezierTo(
        size.width / 2, -arcHeight, size.width / 2 + arcWidth / 2, 0);
    path.lineTo(size.width - cornerRadius, 0);

    // Top-right corner
    path.arcToPoint(
      Offset(size.width, cornerRadius),
      radius: Radius.circular(cornerRadius),
    );

    // Right edge
    path.lineTo(size.width, size.height - cornerRadius);

    // Bottom-right corner
    path.arcToPoint(
      Offset(size.width - cornerRadius, size.height),
      radius: Radius.circular(100),
    );

    // Bottom edge
    path.lineTo(cornerRadius, size.height);

    // Bottom-left corner
    path.arcToPoint(
      Offset(0, size.height - 80),
      radius: Radius.circular(80),
    );

    // Left edge
    path.lineTo(0, cornerRadius);

    // Top-left corner
    path.arcToPoint(
      Offset(cornerRadius, 0),
      radius: Radius.circular(cornerRadius),
    );

    // Draw the path
    canvas.drawPath(path, paint);

    // Draw the red border
    final redBorderPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;
    canvas.drawPath(path, redBorderPaint);

    // Optional: Draw the white dashed border inside the red border
    final borderPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Create a dashed border effect
    double dashWidth = 5;
    double dashSpace = 5;
    double distance = 0;

    for (PathMetric pathMetric in path.computeMetrics()) {
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
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
