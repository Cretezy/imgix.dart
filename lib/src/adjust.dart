import 'package:imgix/src/utils.dart';

final ApplyParams applyBrightness = (queryParameters, options) {
  if (options.brightness == null) {
    return;
  }

  assert(-100 <= options.brightness && options.brightness <= 100,
      "Brightness must be between -100 and +100 (inclusive)");

  queryParameters["bri"] = trimDouble(options.brightness);
};
