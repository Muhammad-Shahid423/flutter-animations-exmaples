import 'dart:math';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class Example3 extends StatefulWidget {
  const Example3({super.key});

  @override
  State<Example3> createState() => _Example3State();
}

const double _widthAndHeight = 100;

class _Example3State extends State<Example3> with TickerProviderStateMixin {
  late AnimationController _xController;
  late AnimationController _yController;
  late AnimationController _zController;

  late Tween<double> _animation;

  @override
  void initState() {
    super.initState();

    _xController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    _yController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    )..repeat();

    _zController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 40),
    )..repeat();

    _animation = Tween<double>(begin: 0, end: pi * 2);
  }

  @override
  void dispose() {
    _xController.dispose();
    _yController.dispose();
    _zController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Example 3")),
      body: Center(
        child: AnimatedBuilder(
          animation: Listenable.merge([
            _xController,
            _yController,
            _zController,
          ]),
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform:
                  Matrix4.identity()
                    ..rotateX(_animation.evaluate(_xController))
                    ..rotateY(_animation.evaluate(_yController))
                    ..rotateZ(_animation.evaluate(_zController)),
              child: Stack(
                children: [
                  // Back
                  Transform(
                    alignment: Alignment.center,
                    transform:
                        Matrix4.identity()
                          ..translate(Vector3(0, 0, -_widthAndHeight)),
                    child: _buildFace(Colors.purple),
                  ),
                  // Left
                  Transform(
                    alignment: Alignment.centerLeft,
                    transform: Matrix4.identity()..rotateY(pi / 2),
                    child: _buildFace(Colors.red),
                  ),
                  // Right
                  Transform(
                    alignment: Alignment.centerRight,
                    transform: Matrix4.identity()..rotateY(-pi / 2),
                    child: _buildFace(Colors.blue),
                  ),
                  // Front
                  _buildFace(Colors.green),
                  // Top
                  Transform(
                    alignment: Alignment.topCenter,
                    transform: Matrix4.identity()..rotateX(-pi / 2),
                    child: _buildFace(Colors.orange),
                  ),
                  // Bottom
                  Transform(
                    alignment: Alignment.bottomCenter,
                    transform: Matrix4.identity()..rotateX(pi / 2),
                    child: _buildFace(Colors.brown),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFace(Color color) {
    return Container(
      width: _widthAndHeight,
      height: _widthAndHeight,
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(2, 2),
          ),
        ],
      ),
    );
  }
}
