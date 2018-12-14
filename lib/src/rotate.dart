import 'package:imgix/src/utils.dart';

/// https://docs.imgix.com/apis/url/rotation/flip
enum ImgixFlip {
  horizontal,
  vertical,
  horizontalVertical,
}

final ApplyParams applyRotation = (queryParameters, options) {
  if (options.rotation == null) {
    return;
  }

  assert(options.rotation >= 0 && options.rotation < 360,
      "Rotation must be between [0, 360)");

  queryParameters["rot"] = trimDouble(options.rotation);
};

final ApplyParams applyFlip = (queryParameters, options) {
  if (options.flip == null) {
    return;
  }

  switch (options.flip) {
    case ImgixFlip.horizontal:
      queryParameters["flip"] = "h";
      break;
    case ImgixFlip.vertical:
      queryParameters["flip"] = "v";
      break;
    case ImgixFlip.horizontalVertical:
      queryParameters["flip"] = "hv";
      break;
  }
};
