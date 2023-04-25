import 'package:imgix/src/utils.dart';

/// https://docs.imgix.com/apis/url/rotation/flip
enum ImgixFlip {
  horizontal,
  vertical,
  horizontalVertical,
}

final ApplyParams applyRotation = (queryParameters, options) {
  final rotation = options.rotation;
  if (rotation == null) {
    return;
  }

  assert(rotation >= 0 && rotation < 360, "Rotation must be between [0, 360)");

  queryParameters["rot"] = trimDouble(rotation);
};

final ApplyParams applyFlip = (queryParameters, options) {
  final flip = options.flip;
  if (flip == null) {
    return;
  }

  switch (flip) {
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
