# Imgix Dart

An [Imgix](https://imgix.com) library for Dart. Generate Imgix URLs with options easily

For use in Flutter, check out [`imgix_flutter`](https://pub.dartlang.org/packages/imgix_flutter)

## Install
Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  imgix: ^0.1.2
```

## Usage

[API Docs](https://pub.dartlang.org/documentation/imgix/latest)

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

Please file feature requests and bugs at the [issue tracker](https://github.com/Cretezy/imgix.dart).
