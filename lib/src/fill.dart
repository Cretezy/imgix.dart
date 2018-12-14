import 'package:imgix/src/utils.dart';

/// https://docs.imgix.com/apis/url/fill/fill
enum ImgixFillMode {
  solid,
  blur,
}

final ApplyParams applyBackgroundColor = (queryParameters, options) {
  if (options.backgroundColor == null) {
    return;
  }

  assertColor(options.backgroundColor, "Background color");

  queryParameters["bg"] = options.backgroundColor;
};

final ApplyParams applyFillColor = (queryParameters, options) {
  if (options.fillColor == null) {
    return;
  }

  assertColor(options.fillColor, "Fill color");

  queryParameters["fill-color"] = options.fillColor;
};

final ApplyParams applyFillMode = (queryParameters, options) {
  if (options.fillMode == null) {
    return;
  }

  switch (options.fillMode) {
    case ImgixFillMode.blur:
      queryParameters["fill"] = "blur";
      break;
    case ImgixFillMode.solid:
      queryParameters["fill"] = "solid";
      break;
  }
};
