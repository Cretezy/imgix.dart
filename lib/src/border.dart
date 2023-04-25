import 'package:imgix/src/utils.dart';

/// https://docs.imgix.com/apis/url/border-and-padding/border
class ImgixBorder {
  /// 3 (RGB, FFF), 4 (ARGB, FFFF), 6 (RGB, FFFFFF), or 8 (ARGB, FFFFFFFF) character color hex (without #)
  final String color;

  /// Width in pixel
  final int width;

  ImgixBorder({
    required this.color,
    required this.width,
  });

  ImgixBorder copyWith(String? color, int? width) => ImgixBorder(
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
    required this.topLeft,
    required this.topRight,
    required this.bottomLeft,
    required this.bottomRight,
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

  ImgixBorderRadius copyWith({
    int? topLeft,
    int? topRight,
    int? bottomLeft,
    int? bottomRight,
  }) =>
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
  final border = options.border;
  if (border == null) {
    return;
  }

  assertColor(border.color, "Border color");

  queryParameters["border"] = "${border.width},${border.color}";
};

final ApplyParams applyBorderRadius = (queryParameters, options) {
  final borderRadius = options.borderRadius;
  if (borderRadius == null) {
    return;
  }

  assert(options.border != null, "Border must be set to use borderRadius");

  if (borderRadius.isCircular) {
    queryParameters["border-radius"] = borderRadius.topLeft.toString();
  } else {
    queryParameters["border-radius"] =
        "${borderRadius.topLeft},${borderRadius.topRight},${borderRadius.bottomRight},${borderRadius.bottomLeft}";
  }
};

final ApplyParams applyBorderRadiusInner = (queryParameters, options) {
  final borderRadiusInner = options.borderRadiusInner;
  if (borderRadiusInner == null) {
    return;
  }

  assert(options.border != null, "Border must be set to use borderRadiusInner");

  if (borderRadiusInner.isCircular) {
    queryParameters["border-radius-inner"] =
        borderRadiusInner.topLeft.toString();
  } else {
    queryParameters["border-radius-inner"] =
        "${borderRadiusInner.topLeft},${borderRadiusInner.topRight},${borderRadiusInner.bottomRight},${borderRadiusInner.bottomLeft}";
  }
};

final ApplyParams applyPadding = (queryParameters, options) {
  final padding = options.padding;
  if (padding == null) {
    return;
  }

  queryParameters["pad"] = padding.toString();
};
