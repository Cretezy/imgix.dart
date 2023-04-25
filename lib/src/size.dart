import 'package:imgix/src/utils.dart';

/// https://docs.imgix.com/apis/url/size/fit
enum ImgixFit {
  clamp,
  clip,
  crop,
  faceArea,
  fill,
  fillMax,
  max,
  min,
  scale,
}

final ApplyParams applyFit = (queryParameters, options) {
  final fit = options.fit;
  if (fit == null) {
    return;
  }

  switch (fit) {
    case ImgixFit.clamp:
      queryParameters["fit"] = "clamp";
      break;
    case ImgixFit.clip:
      queryParameters["fit"] = "clip";
      break;
    case ImgixFit.crop:
      queryParameters["fit"] = "crop";
      break;
    case ImgixFit.faceArea:
      queryParameters["fit"] = "facearea";
      break;
    case ImgixFit.fill:
      queryParameters["fit"] = "fill";
      break;
    case ImgixFit.fillMax:
      queryParameters["fit"] = "fillmax";
      break;
    case ImgixFit.max:
      queryParameters["fit"] = "max";
      break;
    case ImgixFit.min:
      queryParameters["fit"] = "min";
      break;
    case ImgixFit.scale:
      queryParameters["fit"] = "scale";
      break;
  }
};

final ApplyParams applyWidth = (queryParameters, options) {
  final width = options.width;
  if (width == null) {
    return;
  }

  assert(width > 0, "Images must be over 0px wide");
  assert(width <= 8192, "Images must be under 8192px wide");

  queryParameters["w"] = trimDouble(width);
};

final ApplyParams applyHeight = (queryParameters, options) {
  final height = options.height;
  if (height == null) {
    return;
  }

  assert(height > 0, "Images must be over 0px high");
  assert(height <= 8192, "Images must be under 8192px high");

  queryParameters["h"] = trimDouble(height);
};

final ApplyParams applyMaxWidth = (queryParameters, options) {
  final maxWidth = options.maxWidth;
  if (maxWidth == null) {
    return;
  }

  assert(maxWidth > 0, "Max width must be over 0px wide");
  assert(maxWidth <= 8192, "Max width must be under 8192px wide");
  assert(options.fit == ImgixFit.crop, "Fit must be crop to use max width");

  queryParameters["max-w"] = maxWidth.toString();
};

final ApplyParams applyMaxHeight = (queryParameters, options) {
  final maxHeight = options.maxHeight;
  if (maxHeight == null) {
    return;
  }

  assert(maxHeight > 0, "Max height must be over 0px high");
  assert(maxHeight <= 8192, "Max height must be under 8192px high");
  assert(options.fit == ImgixFit.crop, "Fit must be crop to use max height");
  queryParameters["max-h"] = maxHeight.toString();
};

final ApplyParams applyMinWidth = (queryParameters, options) {
  final minWidth = options.minWidth;
  if (minWidth == null) {
    return;
  }

  assert(minWidth > 0, "Min width must be over 0px wide");
  assert(minWidth <= 8192, "Min width must be under 8192px wide");
  assert(options.fit == ImgixFit.crop, "Fit must be crop to use max width");

  queryParameters["min-w"] = minWidth.toString();
};

final ApplyParams applyMinHeight = (queryParameters, options) {
  final minHeight = options.minHeight;
  if (minHeight == null) {
    return;
  }

  assert(minHeight > 0, "Min height must be over 0px high");
  assert(minHeight <= 8192, "Min height must be under 8192px high");
  assert(options.fit == ImgixFit.crop, "Fit must be crop to use max height");

  queryParameters["min-h"] = minHeight.toString();
};

final ApplyParams applyDevicePixelRatio = (queryParameters, options) {
  final devicePixelRatio = options.devicePixelRatio;
  if (devicePixelRatio == null) {
    return;
  }

  assert(devicePixelRatio > 0, "Device pixel ratio must be over zero");
  assert(devicePixelRatio <= 8, "Device pixel ratio must under or equal to 8");
  assert(options.height != null || options.width != null,
      "Device pixel ratio requires a height or width (or both)");

  queryParameters["dpr"] = trimDouble(devicePixelRatio);
};
