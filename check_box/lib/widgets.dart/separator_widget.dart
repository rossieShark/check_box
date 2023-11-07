import 'package:check_box/calculation_service.dart';

import 'package:flutter/material.dart';

class SeparatorWidget extends StatelessWidget {
  const SeparatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final boxWidth = constraints.constrainWidth();

      return boxWidth <= CalculationService().separatorMinSize
          ? SizedBox(width: boxWidth)
          : SizedBox(
              width: boxWidth,
              height: 1,
              child: CustomPaint(
                painter: DashedLinePainter(
                  dashWidth: 5,
                  gapWidth: 3,
                  dashHeight: 1,
                ),
              ),
            );
    });
  }
}

class DashedLinePainter extends CustomPainter {
  final double dashWidth;
  final double gapWidth;
  final double dashHeight;

  DashedLinePainter({
    super.repaint,
    required this.dashWidth,
    required this.gapWidth,
    required this.dashHeight,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = dashHeight;

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + dashWidth, size.height / 2),
        paint,
      );
      startX += dashWidth + gapWidth;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
