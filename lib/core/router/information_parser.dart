import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'page_state.dart';

class InformationParser extends RouteInformationParser<PageState> {
  @override
  Future<PageState> parseRouteInformation(RouteInformation routeInformation) {
    final uri = routeInformation.uri;
    final state = PageState.fromUri(uri);
    return SynchronousFuture(state);
  }

  @override
  RouteInformation? restoreRouteInformation(PageState state) {
    return RouteInformation(uri: state.toUri());
  }
}
