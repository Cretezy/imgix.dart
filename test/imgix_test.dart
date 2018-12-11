import 'package:imgix/imgix.dart';
import 'package:test/test.dart';

final baseUrl = "https://test.imgix.net/test.png";

void main() {
  test('Sets format and quality', () {
    final url = getImgixUrl(
      baseUrl,
      ImgixOptions(format: ImgixFormat.jpg, quality: 75),
    );

    expect(Uri.parse(url).queryParameters["fm"], equals("jpg"));
    expect(Uri.parse(url).queryParameters["q"], equals("75"));
  });

  test('Sets width and height and devicePixelRatio', () {
    final url = getImgixUrl(
      baseUrl,
      ImgixOptions(width: 100, height: 200, devicePixelRatio: 3.5),
    );

    expect(Uri.parse(url).queryParameters["w"], equals("100"));
    expect(Uri.parse(url).queryParameters["h"], equals("200"));
    expect(Uri.parse(url).queryParameters["dpr"], equals("3.5"));
  });

  test('Sets maxWidth and maxHeight (and fit)', () {
    final url = getImgixUrl(
      baseUrl,
      ImgixOptions(
        maxWidth: 100,
        maxHeight: 200,
        fit: ImgixFit.crop,
      ),
    );

    expect(Uri.parse(url).queryParameters["max-w"], equals("100"));
    expect(Uri.parse(url).queryParameters["max-h"], equals("200"));
    expect(Uri.parse(url).queryParameters["fit"], equals("crop"));
  });

  test('Sets minWidth and minHeight (and fit)', () {
    final url = getImgixUrl(
      baseUrl,
      ImgixOptions(
        minWidth: 100,
        minHeight: 200,
        fit: ImgixFit.crop,
      ),
    );

    expect(Uri.parse(url).queryParameters["min-w"], equals("100"));
    expect(Uri.parse(url).queryParameters["min-h"], equals("200"));
    expect(Uri.parse(url).queryParameters["fit"], equals("crop"));
  });

  test('Sets single auto', () {
    final url = getImgixUrl(
      baseUrl,
      ImgixOptions(auto: [ImgixAuto.compress]),
    );

    expect(Uri.parse(url).queryParameters["auto"], equals("compress"));
  });

  test('Sets multiple auto', () {
    final url = getImgixUrl(
      baseUrl,
      ImgixOptions(
        auto: [ImgixAuto.compress, ImgixAuto.format],
      ),
    );

    expect(Uri.parse(url).queryParameters["auto"], equals("compress,format"));
  });

  test('Sets trim and trimTolerance', () {
    final url = getImgixUrl(
      baseUrl,
      ImgixOptions(trim: ImgixTrim.auto, trimTolerance: 11.1),
    );

    expect(Uri.parse(url).queryParameters["trim"], equals("auto"));
    expect(Uri.parse(url).queryParameters["trimtol"], equals("11.1"));
  });
}
