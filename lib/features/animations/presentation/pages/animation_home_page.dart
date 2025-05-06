import 'package:flutter/material.dart';
import '../../../../core/router/page_state.dart';
import '../../../../core/router/supercharged_router.dart';

class AnimationHomePage extends StatelessWidget {
  const AnimationHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final router = Router.of(context).routerDelegate as SuperchargedRouter;

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Animations')),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(12),
            child: ElevatedButton(
              onPressed: () {
                router.updateState(PageState(animationExample: index + 1));
              },
              child: Text('Example ${index + 1}'),
            ),
          );
        },
      ),
    );
  }
}
