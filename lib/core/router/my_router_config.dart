import 'package:flutter/material.dart';
import 'supercharged_router.dart';
import 'information_parser.dart';
import 'page_state.dart';

class MyRouterConfiguration extends RouterConfig<PageState> {
  final SuperchargedRouter delegate;
  final InformationParser parser;

  MyRouterConfiguration({required this.delegate, required this.parser})
    : super(
        routerDelegate: delegate,
        routeInformationParser: parser,
        routeInformationProvider: PlatformRouteInformationProvider(
          initialRouteInformation: RouteInformation(uri: Uri.parse('/')),
        ),
      );
}
