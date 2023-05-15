import 'package:imgix/imgix.dart';

/// Removes ".0" from doubles
String trimDouble(double value) {
  final stringValue = value.toString();

  if (stringValue.endsWith(".0")) {
    return stringValue.substring(0, stringValue.length - 2);
  }

  return stringValue;
}

typedef ApplyParams = void Function(
  Map<String, String> queryParameters,
  ImgixOptions options,
);

/// Asserts that a string is a valid Imgix color code
void assertColor(String color, String valueName) {
  final lengths = <int>[3, 4, 6, 8];

  assert(lengths.contains(color.length),
      "$valueName must be a 3 (RGB, FFF), 4 (ARGB, FFFF), 6 (RGB, FFFFFF), or 8 (ARGB, FFFFFFFF) characters long hex (without #)");
}
