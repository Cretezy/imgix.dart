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
  if (options.fit == null) {
    return;
  }

  switch (options.fit) {
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
  if (options.width == null) {
    return;
  }

  assert(options.width > 0, "Images must be over 0px wide");
  assert(options.width <= 8192, "Images must be under 8192px wide");

  queryParameters["w"] = trimDouble(options.width);
};

final ApplyParams applyHeight = (queryParameters, options) {
  if (options.height == null) {
    return;
  }

  assert(options.height > 0, "Images must be over 0px high");
  assert(options.height <= 8192, "Images must be under 8192px high");

  queryParameters["h"] = trimDouble(options.height);
};

final ApplyParams applyMaxWidth = (queryParameters, options) {
  if (options.maxWidth == null) {
    return;
  }

  assert(options.maxWidth > 0, "Max width must be over 0px wide");
  assert(options.maxWidth <= 8192, "Max width must be under 8192px wide");
  assert(options.fit == ImgixFit.crop, "Fit must be crop to use max width");

  queryParameters["max-w"] = options.maxWidth.toString();
};

final ApplyParams applyMaxHeight = (queryParameters, options) {
  if (options.maxHeight == null) {
    return;
  }

  assert(options.maxHeight > 0, "Max height must be over 0px high");
  assert(options.maxHeight <= 8192, "Max height must be under 8192px high");
  assert(options.fit == ImgixFit.crop, "Fit must be crop to use max height");
  queryParameters["max-h"] = options.maxHeight.toString();
};

final ApplyParams applyMinWidth = (queryParameters, options) {
  if (options.minWidth == null) {
    return;
  }

  assert(options.minWidth > 0, "Min width must be over 0px wide");
  assert(options.minWidth <= 8192, "Min width must be under 8192px wide");
  assert(options.fit == ImgixFit.crop, "Fit must be crop to use max width");

  queryParameters["min-w"] = options.minWidth.toString();
};

final ApplyParams applyMinHeight = (queryParameters, options) {
  if (options.minHeight == null) {
    return;
  }

  assert(options.minHeight > 0, "Min height must be over 0px high");
  assert(options.minHeight <= 8192, "Min height must be under 8192px high");
  assert(options.fit == ImgixFit.crop, "Fit must be crop to use max height");

  queryParameters["min-h"] = options.minHeight.toString();
};

final ApplyParams applyDevicePixelRatio = (queryParameters, options) {
  if (options.devicePixelRatio == null) {
    return;
  }

  assert(options.devicePixelRatio > 0, "Device pixel ratio must be over zero");
  assert(options.devicePixelRatio <= 8,
      "Device pixel ratio must under or equal to 8");
  assert(options.height != null || options.width != null,
      "Device pixel ratio requires a height or width (or both)");

  queryParameters["dpr"] = trimDouble(options.devicePixelRatio);
};
