# Imgix Dart

A [Imgix](https://imgix.com) library for Dart.

## Usage

```dart
import 'package:imgix/imgix.dart';

main() {
  final url = getImgixUrl(
    "https://test.imgix.net/test.png",
    ImgixOptions(
      width: 100,
      height: 200,
      format: ImgixFormat.jpg,
      quality: 75,
      auto: [ImgixAuto.compress],
    ),
  );

  print(url); // https://test.imgix.net/test.png?fm=jpg&h=200&w=100&auto=compress&q=75
}
```

## Features and bugs

Some options are missing. They will be added on request, or open a pull request!

Please file feature requests and bugs at the [issue tracker][https://github.com/Cretezy/imgix.dart].
