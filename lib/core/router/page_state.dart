class PageState {
  final int? animationExample;

  const PageState({this.animationExample});

  factory PageState.fromUri(Uri uri) {
    if (uri.pathSegments.isEmpty) return PageState();
    if (uri.pathSegments[0] == 'animation' && uri.pathSegments.length > 1) {
      final index = int.tryParse(uri.pathSegments[1]);
      return PageState(animationExample: index);
    }
    return PageState();
  }

  Uri toUri() {
    if (animationExample != null) {
      return Uri(path: '/animation/$animationExample');
    }
    return Uri(path: '/');
  }
}
