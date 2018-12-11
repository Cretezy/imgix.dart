/// Removes ".0" from doubles
String trimDouble(double value) {
  final stringValue = value.toString();

  if (stringValue.endsWith(".0")) {
    return stringValue.substring(0, stringValue.length - 2);
  }

  return stringValue;
}
