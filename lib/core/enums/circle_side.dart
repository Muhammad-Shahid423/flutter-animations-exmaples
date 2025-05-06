import 'dart:ui';

enum CircleSide {
  left,
  right,
  // top,
  // bottom,
}

extension ToPath on CircleSide {
  Path toPath(Size size) {
    var path = Path();

    late Offset offset;
    late bool clockwise;

    switch (this) {
      case CircleSide.left:
        path.moveTo(size.width, 0);
        offset = Offset(size.width, size.height);
        clockwise = false;
        break;
      case CircleSide.right:
        // path.moveTo(0, 0);
        offset = Offset(0, size.height);
        clockwise = true;
        break;
      // case CircleSide.top:
      //   path.moveTo(0, size.height);
      //   offset = Offset(size.width, size.height);
      //   clockwise = false;
      //   break;
      // case CircleSide.bottom:
      //   path.moveTo(0, 0);
      //   offset = Offset(size.width, 0);
      //   clockwise = true;
      //   break;
    }
    path.arcToPoint(
      offset,
      radius: Radius.elliptical(size.width / 2, size.height / 2),
      clockwise: clockwise,
    );

    path.close();
    return path;
  }
}
