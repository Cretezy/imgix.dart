import 'package:imgix/src/utils.dart';

/// https://docs.imgix.com/apis/url/fill/fill
enum ImgixFillMode {
  solid,
  blur,
}

final ApplyParams applyBackgroundColor = (queryParameters, options) {
  final backgroundColor = options.backgroundColor;
  if (backgroundColor == null) {
    return;
  }

  assertColor(backgroundColor, "Background color");

  queryParameters["bg"] = backgroundColor;
};

final ApplyParams applyFillColor = (queryParameters, options) {
  final fillColor = options.fillColor;
  if (fillColor == null) {
    return;
  }

  assertColor(fillColor, "Fill color");

  queryParameters["fill-color"] = fillColor;
};

final ApplyParams applyFillMode = (queryParameters, options) {
  final fillMode = options.fillMode;
  if (fillMode == null) {
    return;
  }

  switch (fillMode) {
    case ImgixFillMode.blur:
      queryParameters["fill"] = "blur";
      break;
    case ImgixFillMode.solid:
      queryParameters["fill"] = "solid";
      break;
  }
};
