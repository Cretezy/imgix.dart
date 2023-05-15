import 'package:imgix/src/utils.dart';

final ApplyParams applyBrightness = (queryParameters, options) {
  final brightness = options.brightness;
  if (brightness == null) {
    return;
  }

  assert(-100 <= brightness && brightness <= 100,
      "Brightness must be between -100 and +100 (inclusive)");

  queryParameters["bri"] = trimDouble(brightness);
};
