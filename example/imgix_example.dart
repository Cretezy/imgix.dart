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

  print(
      url); // https://test.imgix.net/test.png?fm=jpg&h=200&w=100&auto=compress&q=75
}
