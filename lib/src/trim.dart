import 'package:imgix/src/utils.dart';

/// https://docs.imgix.com/apis/url/trim/trim
enum ImgixTrim {
  auto,
  color,
}

final ApplyParams applyTrim = (queryParameters, options) {
  if (options.trim == null) {
    return;
  }

  switch (options.trim) {
    case ImgixTrim.auto:
      queryParameters["trim"] = "auto";
      break;
    case ImgixTrim.color:
      queryParameters["trim"] = "color";
      break;
  }
};

final ApplyParams applyTrimTolerance = (queryParameters, options) {
  if (options.trimTolerance == null) {
    return;
  }

  assert(
      options.trimTolerance >= 0, "Trim tolerance must be over or equal to 0");

  queryParameters["trimtol"] = trimDouble(options.trimTolerance);
};
