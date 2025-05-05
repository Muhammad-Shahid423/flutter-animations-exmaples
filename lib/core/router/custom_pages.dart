import 'package:flutter/material.dart';

class CustomTransitionPage extends Page {
  final Widget child;
  final Widget Function(
    BuildContext,
    Animation<double>,
    Animation<double>,
    Widget,
  )
  transitionsBuilder;
  final Duration duration;

  const CustomTransitionPage({
    required LocalKey key,
    required this.child,
    required this.transitionsBuilder,
    this.duration = const Duration(milliseconds: 300),
  }) : super(key: key);

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: transitionsBuilder,
      transitionDuration: duration,
    );
  }
}
