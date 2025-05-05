import 'package:flutter/material.dart';
import 'core/router/information_parser.dart';
import 'core/router/my_router_config.dart';
import 'core/router/supercharged_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final delegate = SuperchargedRouter();
  final parser = InformationParser();

  runApp(
    MaterialApp.router(
      title: 'Flutter Animations',
      debugShowCheckedModeBanner: false,
      routerConfig: MyRouterConfiguration(delegate: delegate, parser: parser),
    ),
  );
}
