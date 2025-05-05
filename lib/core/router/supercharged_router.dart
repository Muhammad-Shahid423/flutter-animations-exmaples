import 'package:flutter/material.dart';
import '../../features/animations/presentation/pages/animation_home_page.dart';
import 'package:example1/imports/animations.dart';
import 'custom_pages.dart';
import 'page_state.dart';

class SuperchargedRouter extends RouterDelegate<PageState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageState> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  PageState _state = const PageState();
  PageState get state => _state;

  void updateState(PageState newState) {
    _state = newState;
    notifyListeners();
  }

  @override
  Future<void> setNewRoutePath(PageState configuration) async {
    _state = configuration;
  }

  @override
  PageState get currentConfiguration => _state;

  Widget _getExampleWidget(int index) {
    switch (index) {
      case 1:
        return const Example1();
      case 2:
        return const Example2();
      default:
        return const Scaffold(body: Center(child: Text('Example not found')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Page> pages = [
      const MaterialPage(key: ValueKey('home'), child: AnimationHomePage()),
    ];

    if (_state.animationExample != null) {
      pages.add(
        CustomTransitionPage(
          key: ValueKey('example-${_state.animationExample}'),
          child: _getExampleWidget(_state.animationExample!),
          transitionsBuilder: _fadeSlide,
        ),
      );
    }

    return Navigator(
      key: navigatorKey,
      pages: pages,
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        _state = const PageState();
        notifyListeners();
        return true;
      },
    );
  }

  Widget _fadeSlide(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.1, 0.1),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    );
  }
}
