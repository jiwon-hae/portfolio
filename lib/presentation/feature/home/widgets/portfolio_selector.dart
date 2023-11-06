import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/core/callback/callbacks.dart';
import 'package:portfolio/core/math/math_extension.dart';
import '../../../model/ui_portfolio_entry.dart';
import 'portfolio_selector_painter.dart';

class PortfolioSelector extends StatefulWidget {
  const PortfolioSelector({super.key, required this.portfolioEntries, required this.onAngleChanged});

  final List<UiPortfolioEntry> portfolioEntries;
  final ValueCallback<int> onAngleChanged;

  @override
  State<PortfolioSelector> createState() => _PortfolioSelectorState();
}

class _PortfolioSelectorState extends State<PortfolioSelector> {
  double rotationAngle = 0.0;
  int bottomRightVertexIndex = 0;
  late int numSide = widget.portfolioEntries.length * 2;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double selectorSize = mediaQuery.height * 0.8 / 2;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final List<Color> colors = <Color>[
      colorScheme.primary,
      colorScheme.secondary,
      colorScheme.tertiary,
    ];

    return GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            rotationAngle = (rotationAngle + details.delta.dx * 0.01) %
                (2 * pi); // Adjust the rotation sensitivity

            double relativeAngle = (-rotationAngle).degrees();
            bottomRightVertexIndex = (relativeAngle / (360 / numSide)).round().abs();
            widget.onAngleChanged(bottomRightVertexIndex % (numSide ~/ 2));
          });
        },
        child: Transform.rotate(
          angle: rotationAngle,
          origin: const Offset(0, 0), // Set the origin to the top-left corner
          child: CustomPaint(
            size: Size(selectorSize, selectorSize),
            // Set the size as per your requirements
            painter: PortfolioSelectorPainter(
                backgroundColor: colors[bottomRightVertexIndex % colors.length],
                sides: numSide,
                radius: selectorSize),
          ),
        ));
  }
}
