library imgix;

import 'package:imgix/src/utils.dart';

enum ImgixFormat {
  gif,
  jp2,
  jpg,
  json,
  jxr,
  pjpg,
  mp4,
  png,
  png8,
  png32,
  webm,
  webp,
}

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

enum ImgixAuto {
  compress,
  enhance,
  format,
  redeye,
}

enum ImgixTrim {
  auto,
  color,
}

class ImgixOptions {
  // https://docs.imgix.com/apis/url/format
  final ImgixFormat format;

  // https://docs.imgix.com/apis/url/size/h
  final double height;

  // https://docs.imgix.com/apis/url/size/w
  final double width;

  // https://docs.imgix.com/apis/url/size/max-h
  final int maxHeight;

  // https://docs.imgix.com/apis/url/size/max-w
  final int maxWidth;

  // https://docs.imgix.com/apis/url/size/min-h
  final int minHeight;

  // https://docs.imgix.com/apis/url/size/min-w
  final int minWidth;

  // https://docs.imgix.com/apis/url/size/fit
  final ImgixFit fit;

  // https://docs.imgix.com/apis/url/auto
  final List<ImgixAuto> auto;

  // https://docs.imgix.com/apis/url/trim/trim
  final ImgixTrim trim;

  // https://docs.imgix.com/apis/url/trim/trimtol
  final double trimTolerance;

  // https://docs.imgix.com/apis/url/format/q
  final int quality;

  // https://docs.imgix.com/apis/url/dpr
  final double devicePixelRatio;

  ImgixOptions({
    this.format,
    this.height,
    this.width,
    this.maxHeight,
    this.maxWidth,
    this.minHeight,
    this.minWidth,
    this.fit,
    this.auto,
    this.trim,
    this.trimTolerance,
    this.quality,
    this.devicePixelRatio,
  });

  ImgixOptions copyWith({
    ImgixFormat format,
    bool noFormat = false,
    double height,
    bool noHeight = false,
    double width,
    bool noWidth = false,
    int maxHeight,
    bool noMaxHeight = false,
    int maxWidth,
    bool noMaxWidth = false,
    int minHeight,
    bool noMinHeight = false,
    int minWidth,
    bool noMinWidth = false,
    ImgixFit fit,
    bool noFit = false,
    List<ImgixAuto> auto,
    bool noAuto = false,
    ImgixTrim trim,
    bool noTrim = false,
    double trimTolerance,
    bool noTrimTolerance = false,
    int quality,
    bool noQuality = false,
    double devicePixelRatio,
    bool noDevicePixelRatio = false,
  }) =>
      ImgixOptions(
        format: !noFormat ? format ?? this.format : null,
        height: !noHeight ? height ?? this.height : null,
        width: !noWidth ? width ?? this.width : null,
        maxHeight: !noMaxHeight ? maxHeight ?? this.maxHeight : null,
        maxWidth: !noMaxWidth ? maxWidth ?? this.maxWidth : null,
        minHeight: !noMinHeight ? minHeight ?? this.minHeight : null,
        minWidth: !noMinWidth ? minWidth ?? this.minWidth : null,
        fit: !noFit ? fit ?? this.fit : null,
        auto: !noAuto ? auto ?? this.auto : null,
        trim: !noTrim ? trim ?? this.trim : null,
        trimTolerance:
            !noTrimTolerance ? trimTolerance ?? this.trimTolerance : null,
        quality: !noQuality ? quality ?? this.quality : null,
        devicePixelRatio: !noDevicePixelRatio
            ? devicePixelRatio ?? this.devicePixelRatio
            : null,
      );
}

/// Generates an Imgix URL from a [url] and [options]
String getImgixUrl(String url, ImgixOptions options) {
  // No options is a passthrough
  if (options == null) {
    return url;
  }

  final queryParameters = Map<String, String>();

  if (options.format != null) {
    switch (options.format) {
      case ImgixFormat.gif:
        queryParameters["fm"] = "gif";
        break;
      case ImgixFormat.jp2:
        queryParameters["fm"] = "jp2";
        break;
      case ImgixFormat.jpg:
        queryParameters["fm"] = "jpg";
        break;
      case ImgixFormat.json:
        queryParameters["fm"] = "json";
        break;
      case ImgixFormat.jxr:
        queryParameters["fm"] = "jxr";
        break;
      case ImgixFormat.pjpg:
        queryParameters["fm"] = "pjpg";
        break;
      case ImgixFormat.mp4:
        queryParameters["fm"] = "mp4";
        break;
      case ImgixFormat.png:
        queryParameters["fm"] = "png";
        break;
      case ImgixFormat.png8:
        queryParameters["fm"] = "png8";
        break;
      case ImgixFormat.png32:
        queryParameters["fm"] = "png32";
        break;
      case ImgixFormat.webm:
        queryParameters["fm"] = "webm";
        break;
      case ImgixFormat.webp:
        queryParameters["fm"] = "webp";
        break;
    }
  }

  if (options.height != null) {
    assert(options.height > 0, "Images must be over 0px high");
    assert(options.height <= 8192, "Images must be under 8192px high");

    queryParameters["h"] = trimDouble(options.height);
  }
  if (options.width != null) {
    assert(options.width > 0, "Images must be over 0px wide");
    assert(options.width <= 8192, "Images must be under 8192px wide");

    queryParameters["w"] = trimDouble(options.width);
  }

  if (options.maxHeight != null) {
    assert(options.maxHeight > 0, "Max height must be over 0px high");
    assert(options.maxHeight <= 8192, "Max height must be under 8192px high");
    assert(options.fit == ImgixFit.crop, "Fit must be crop to use max height");
    queryParameters["max-h"] = options.maxHeight.toString();
  }
  if (options.maxWidth != null) {
    assert(options.maxWidth > 0, "Max width must be over 0px wide");
    assert(options.maxWidth <= 8192, "Max width must be under 8192px wide");
    assert(options.fit == ImgixFit.crop, "Fit must be crop to use max width");

    queryParameters["max-w"] = options.maxWidth.toString();
  }

  if (options.minHeight != null) {
    assert(options.minHeight > 0, "Min height must be over 0px high");
    assert(options.minHeight <= 8192, "Min height must be under 8192px high");
    assert(options.fit == ImgixFit.crop, "Fit must be crop to use max height");
    queryParameters["min-h"] = options.minHeight.toString();
  }
  if (options.minWidth != null) {
    assert(options.minWidth > 0, "Min width must be over 0px wide");
    assert(options.minWidth <= 8192, "Min width must be under 8192px wide");
    assert(options.fit == ImgixFit.crop, "Fit must be crop to use max width");

    queryParameters["min-w"] = options.minWidth.toString();
  }

  if (options.fit != null) {
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
  }

  if (options.auto?.isNotEmpty == true) {
    final auto = List<String>();

    if (options.auto.contains(ImgixAuto.compress)) {
      auto.add("compress");
    }
    if (options.auto.contains(ImgixAuto.enhance)) {
      auto.add("enhance");
    }
    if (options.auto.contains(ImgixAuto.format)) {
      auto.add("format");
    }
    if (options.auto.contains(ImgixAuto.redeye)) {
      auto.add("redeye");
    }

    queryParameters["auto"] = auto.join(",");
  }

  if (options.trim != null) {
    switch (options.trim) {
      case ImgixTrim.auto:
        queryParameters["trim"] = "auto";
        break;
      case ImgixTrim.color:
        queryParameters["trim"] = "color";
        break;
    }
  }

  if (options.trimTolerance != null) {
    assert(options.trimTolerance >= 0,
        "Trim tolerance must be over or equal to 0");

    queryParameters["trimtol"] = trimDouble(options.trimTolerance);
  }

  if (options.quality != null) {
    assert(
        [
          null,
          ImgixFormat.jpg,
          ImgixFormat.pjpg,
          ImgixFormat.webp,
          ImgixFormat.jxr,
        ].contains(options.format),
        "Quality can only be applied to formats jpg, pjpg, webp, or jxr (or set to null)");

    queryParameters["q"] = options.quality.toString();
  }

  if (options.devicePixelRatio != null) {
    assert(
        options.devicePixelRatio > 0, "Device pixel ratio must be over zero");
    assert(options.devicePixelRatio <= 8,
        "Device pixel ratio must under or equal to 8");
    assert(options.height != null || options.width != null,
        "Device pixel ratio requires a height or width (or both)");

    queryParameters["dpr"] = trimDouble(options.devicePixelRatio);
  }

  final uri = Uri.parse(url);

  // Merge old query parameters
  uri.queryParameters.forEach((key, value) {
    if (!queryParameters.containsKey(key)) {
      queryParameters[key] = value;
    }
  });

  return uri.replace(queryParameters: queryParameters).toString();
}
