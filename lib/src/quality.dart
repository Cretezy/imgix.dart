import 'package:imgix/src/format.dart';
import 'package:imgix/src/utils.dart';

final ApplyParams applyQuality = (queryParameters, options) {
  if (options.quality == null) {
    return;
  }

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
};
