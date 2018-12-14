import 'package:imgix/src/utils.dart';
import 'package:meta/meta.dart';

/// https://docs.imgix.com/apis/url/border-and-padding/border
class ImgixBorder {
  /// 3 (RGB, FFF), 4 (ARGB, FFFF), 6 (RGB, FFFFFF), or 8 (ARGB, FFFFFFFF) character color hex (without #)
  final String color;

  /// Width in pixel
  final int width;

  ImgixBorder({@required this.color, @required this.width});

  ImgixBorder copyWith(String color, int width) => ImgixBorder(
        color: color ?? this.color,
        width: width ?? this.width,
      );

  @override
  String toString() {
    return "ImgixBorder(#$color, $width)";
  }
}

/// https://docs.imgix.com/apis/url/border-and-padding/border-radius and
/// https://docs.imgix.com/apis/url/border-and-padding/border-radius-inner
class ImgixBorderRadius {
  final int topLeft;
  final int topRight;
  final int bottomLeft;
  final int bottomRight;

  ImgixBorderRadius({
    @required this.topLeft,
    @required this.topRight,
    @required this.bottomLeft,
    @required this.bottomRight,
  });

  /// ImgixBorderRadius with all sides the same width
  factory ImgixBorderRadius.circular(int all) {
    return ImgixBorderRadius(
      topLeft: all,
      topRight: all,
      bottomLeft: all,
      bottomRight: all,
    );
  }

  ImgixBorderRadius copyWith(
    int topLeft,
    int topRight,
    int bottomLeft,
    int bottomRight,
  ) =>
      ImgixBorderRadius(
        topLeft: topLeft ?? this.topLeft,
        topRight: topRight ?? this.topRight,
        bottomLeft: bottomLeft ?? this.bottomLeft,
        bottomRight: bottomRight ?? this.bottomRight,
      );

  bool get isCircular =>
      topLeft == topRight && topLeft == bottomLeft && topLeft == bottomRight;

  @override
  String toString() {
    if (isCircular) {
      return "ImgixBorderRadius($topLeft)";
    }

    return "ImgixBorderRadius($topLeft, $topRight, $bottomLeft, $bottomRight)";
  }
}

final ApplyParams applyBorder = (queryParameters, options) {
  if (options.border == null) {
    return;
  }

  assertColor(options.border.color, "Border color");

  queryParameters["border"] = "${options.border.width},${options.border.color}";
};

final ApplyParams applyBorderRadius = (queryParameters, options) {
  if (options.borderRadius == null) {
    return;
  }

  assert(options.border != null, "Border must be set to use borderRadius");

  if (options.borderRadius.isCircular) {
    queryParameters["border-radius"] = options.borderRadius.topLeft.toString();
  } else {
    queryParameters["border-radius"] =
        "${options.borderRadius.topLeft},${options.borderRadius.topRight},${options.borderRadius.bottomRight},${options.borderRadius.bottomLeft}";
  }
};

final ApplyParams applyBorderRadiusInner = (queryParameters, options) {
  if (options.borderRadiusInner == null) {
    return;
  }

  assert(options.border != null, "Border must be set to use borderRadiusInner");

  if (options.borderRadiusInner.isCircular) {
    queryParameters["border-radius-inner"] =
        options.borderRadiusInner.topLeft.toString();
  } else {
    queryParameters["border-radius-inner"] =
        "${options.borderRadiusInner.topLeft},${options.borderRadiusInner.topRight},${options.borderRadiusInner.bottomRight},${options.borderRadiusInner.bottomLeft}";
  }
};

final ApplyParams applyPadding = (queryParameters, options) {
  if (options.padding == null) {
    return;
  }

  queryParameters["pad"] = options.padding.toString();
};
