import 'package:imgix/src/utils.dart';

/// https://docs.imgix.com/apis/url/trim/trim
enum ImgixTrim {
  auto,
  color,
}

final ApplyParams applyTrim = (queryParameters, options) {
  final trim = options.trim;
  if (trim == null) {
    return;
  }

  switch (trim) {
    case ImgixTrim.auto:
      queryParameters["trim"] = "auto";
      break;
    case ImgixTrim.color:
      queryParameters["trim"] = "color";
      break;
  }
};

final ApplyParams applyTrimTolerance = (queryParameters, options) {
  final trimTolerance = options.trimTolerance;
  if (trimTolerance == null) {
    return;
  }

  assert(trimTolerance >= 0, "Trim tolerance must be over or equal to 0");

  queryParameters["trimtol"] = trimDouble(trimTolerance);
};
