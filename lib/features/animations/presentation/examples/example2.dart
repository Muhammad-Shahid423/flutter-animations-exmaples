import 'dart:math';

import 'package:flutter/material.dart';
import 'package:example1/core/enums/circle_side.dart';
import 'package:example1/core/widgets/half_circle_clipper.dart';

class Example2 extends StatefulWidget {
  const Example2({super.key});

  @override
  State<Example2> createState() => _Example2State();
}

extension on VoidCallback {
  Future<void> delayed(Duration duration) => Future.delayed(duration, this);
}

class _Example2State extends State<Example2> with TickerProviderStateMixin {
  late AnimationController _counterClockwiseController;
  late Animation<double> _counterClockwiseAnimation;

  late AnimationController _flipController;
  late Animation<double> _flipAnimation;

  double _rotationZ = 0;
  double _flipY = 0;

  @override
  void initState() {
    super.initState();

    // Initialize counter-clockwise rotation
    _counterClockwiseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _counterClockwiseAnimation = Tween<double>(
      begin: _rotationZ,
      end: _rotationZ - (pi / 2),
    ).animate(
      CurvedAnimation(
        parent: _counterClockwiseController,
        curve: Curves.bounceOut,
      ),
    );

    // Initialize flip animation
    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _flipAnimation = Tween<double>(begin: _flipY, end: _flipY + pi).animate(
      CurvedAnimation(parent: _flipController, curve: Curves.bounceOut),
    );

    // Chain animations: when one ends, start the other
    _counterClockwiseController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _flipY += pi;
        _flipAnimation = Tween<double>(
          begin: _flipAnimation.value,
          end: _flipY,
        ).animate(
          CurvedAnimation(parent: _flipController, curve: Curves.bounceOut),
        );

        _flipController
          ..reset()
          ..forward();
      }
    });

    _flipController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _rotationZ -= pi / 2;
        _counterClockwiseAnimation = Tween<double>(
          begin: _counterClockwiseAnimation.value,
          end: _rotationZ,
        ).animate(
          CurvedAnimation(
            parent: _counterClockwiseController,
            curve: Curves.bounceOut,
          ),
        );

        _counterClockwiseController
          ..reset()
          ..forward();
      }
    });

    // Start the animation sequence with delay
    _counterClockwiseController
      ..reset()
      ..forward.delayed(const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _counterClockwiseController.dispose();
    _flipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Example 2")),
      body: SafeArea(
        child: Center(
          child: AnimatedBuilder(
            animation: _counterClockwiseAnimation,
            builder: (context, child) {
              return Transform(
                alignment: Alignment.center,
                transform:
                    Matrix4.identity()
                      ..rotateZ(_counterClockwiseAnimation.value),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [LeftHalf(), RightHalf()],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class LeftHalf extends StatelessWidget {
  const LeftHalf({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.findAncestorStateOfType<_Example2State>()!;
    return AnimatedBuilder(
      animation: state._flipAnimation,
      builder: (context, child) {
        return Transform(
          alignment: Alignment.centerRight,
          transform: Matrix4.identity()..rotateY(state._flipAnimation.value),
          child: ClipPath(
            clipper: const HalfCircleClipper(side: CircleSide.left),
            child: Container(
              width: 100,
              height: 100,
              color: const Color(0xff0057b7),
            ),
          ),
        );
      },
    );
  }
}

class RightHalf extends StatelessWidget {
  const RightHalf({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.findAncestorStateOfType<_Example2State>()!;
    return AnimatedBuilder(
      animation: state._flipAnimation,
      builder: (context, child) {
        return Transform(
          alignment: Alignment.centerLeft,
          transform: Matrix4.identity()..rotateY(state._flipAnimation.value),
          child: ClipPath(
            clipper: const HalfCircleClipper(side: CircleSide.right),
            child: Container(
              width: 100,
              height: 100,
              color: const Color(0xffffd700),
            ),
          ),
        );
      },
    );
  }
}
