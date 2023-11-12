import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:portfolio/core/callback/callbacks.dart';
import 'package:portfolio/core/math/math_extension.dart';

class RadialListView<T> extends StatefulWidget {
  const RadialListView(
      {super.key,
      required this.items,
      required this.itemBuilder,
      this.onItemSelected,
      this.itemCount,
      this.center});

  final List<T> items;
  final int? itemCount;
  final Widget? center;
  final NullableItemWidgetBuilder<T> itemBuilder;
  final ValueCallback<int>? onItemSelected;

  @override
  State<RadialListView<T>> createState() => _RadialListViewState<T>();
}

class _RadialListViewState<T> extends State<RadialListView<T>>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController.unbounded(vsync: this);

  late double angleDistanceBetweenItems =
      360 / (widget.itemCount ?? widget.items.length);

  double angle = 0;
  Direction prevDirection = Direction.forward;
  Quadrant? previousQuadrant;

  double getItemPositionInAngleFromCenter(
      {required Size itemSize, required Offset position}) {
    final double radAngle = math.atan2(
        position.dy - itemSize.height / 2, position.dx - itemSize.width / 2);
    return radAngle.rad2deg();
  }

  double getItemAngle(int index) {
    return angle + (angleDistanceBetweenItems * index);
  }

  void runDeceleration(double velocity) {
    final Simulation simulation = FrictionSimulation(.08, angle + 1, velocity);
    _animationController.animateWith(simulation);
  }

  @override
  void initState() {
    _animationController.addListener(() {
      if ((angle.toInt() - _animationController.value.toInt()) == 0) {
        _animationController.stop();
      } else {
        setState(() {
          angle = _animationController.value.toInt().toDouble();
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Direction getScrollDirection(double angle, bool isHorizontal) {
    if (angle > 0 && angle < 90 && previousQuadrant == null) {
      previousQuadrant = Quadrant.bottomRight;
      prevDirection = isHorizontal ? Direction.backward : Direction.forward;
      prevDirection = isHorizontal ? Direction.backward : Direction.forward;
      return prevDirection;
    } else if (angle > 90 && angle < 180 && previousQuadrant == null) {
      previousQuadrant = Quadrant.bottomLeft;
      prevDirection = Direction.backward;
      return prevDirection;
    } else if (angle < 0 && angle > -90 && previousQuadrant == null) {
      previousQuadrant = Quadrant.topRight;
      prevDirection = Direction.forward;
      return prevDirection;
    } else if (angle < -90 && angle > -180 && previousQuadrant == null) {
      previousQuadrant = Quadrant.topLeft;
      prevDirection = isHorizontal ? Direction.forward : Direction.backward;
      return prevDirection;
    } else {
      return prevDirection;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final Size boxSize = constraints.biggest;
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onVerticalDragStart: (details) => _animationController.stop(),
        onVerticalDragUpdate: (details) {
          final double pos = getItemPositionInAngleFromCenter(
              itemSize: boxSize, position: details.localPosition);
          final direction = getScrollDirection(pos, false);
          setState(() {
            angle += ((details.primaryDelta ?? 0) * direction.value);
          });
        },
        onVerticalDragEnd: (details) {
          previousQuadrant = null;
          runDeceleration((details.primaryVelocity ?? 0) * prevDirection.value);
        },
        onHorizontalDragStart: (details) => _animationController.stop(),
        onHorizontalDragUpdate: (details) {
          var pos = getItemPositionInAngleFromCenter(
              itemSize: boxSize, position: details.localPosition);
          var position = getScrollDirection(pos, true);
          setState(() {
            angle += ((details.primaryDelta ?? 0) * position.value);
          });
        },
        onHorizontalDragEnd: (details) {
          previousQuadrant = null;
          runDeceleration((details.primaryVelocity ?? 0) * prevDirection.value);
        },
        child: Stack(
          children: List.generate(
                (widget.itemCount ?? widget.items.length),
                (index) => Align(
                    alignment: Alignment(
                      math.cos(getItemAngle(index).deg2rad()),
                      math.sin(getItemAngle(index).deg2rad()),
                    ),
                    child: Transform.rotate(
                        alignment: Alignment.bottomCenter,
                        angle: getItemAngle(index).deg2rad() + math.pi / 2,
                        child: GestureDetector(
                            onTap: () {
                              if(_animationController.isAnimating){
                                runDeceleration(0);
                                return;
                              }
                              widget.onItemSelected?.call(index);
                            },
                            child: widget.itemBuilder(
                                context, widget.items[index])))),
              ) +
              [
                Align(
                  alignment: const Alignment(0, 0),
                  child: widget.center,
                ),
              ],
        ),
      );
    });
  }
}

enum Quadrant { bottomRight, bottomLeft, topRight, topLeft }

enum Direction {
  forward(1),
  backward(-1);

  const Direction(this.value);

  final int value;
}
