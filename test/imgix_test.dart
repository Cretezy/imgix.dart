import 'package:imgix/imgix.dart';
import 'package:test/test.dart';

final baseUrl = "https://test.imgix.net/test.png";

Map<String, String> getQueryParams(String uri) {
  return Uri.parse(uri).queryParameters;
}

void main() {
  test('Sets format and quality', () {
    final url = getImgixUrl(
      baseUrl,
      ImgixOptions(format: ImgixFormat.jpg, quality: 75),
    );

    expect(getQueryParams(url)["fm"], equals("jpg"));
    expect(getQueryParams(url)["q"], equals("75"));
  });

  test('Sets width and height and devicePixelRatio', () {
    final url = getImgixUrl(
      baseUrl,
      ImgixOptions(width: 100, height: 200, devicePixelRatio: 3.5),
    );

    expect(getQueryParams(url)["w"], equals("100"));
    expect(getQueryParams(url)["h"], equals("200"));
    expect(getQueryParams(url)["dpr"], equals("3.5"));
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

    expect(getQueryParams(url)["max-w"], equals("100"));
    expect(getQueryParams(url)["max-h"], equals("200"));
    expect(getQueryParams(url)["fit"], equals("crop"));
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

    expect(getQueryParams(url)["min-w"], equals("100"));
    expect(getQueryParams(url)["min-h"], equals("200"));
    expect(getQueryParams(url)["fit"], equals("crop"));
  });

  test('Sets single auto', () {
    final url = getImgixUrl(
      baseUrl,
      ImgixOptions(auto: [ImgixAuto.compress]),
    );

    expect(getQueryParams(url)["auto"], equals("compress"));
  });

  test('Sets multiple auto', () {
    final url = getImgixUrl(
      baseUrl,
      ImgixOptions(
        auto: [ImgixAuto.compress, ImgixAuto.format],
      ),
    );

    expect(getQueryParams(url)["auto"], equals("compress,format"));
  });

  test('Sets trim and trimTolerance', () {
    final url = getImgixUrl(
      baseUrl,
      ImgixOptions(trim: ImgixTrim.auto, trimTolerance: 11.1),
    );

    expect(getQueryParams(url)["trim"], equals("auto"));
    expect(getQueryParams(url)["trimtol"], equals("11.1"));
  });

  test('Sets border, borderRadius, and borderRadiusInner', () {
    final url = getImgixUrl(
      baseUrl,
      ImgixOptions(
        border: ImgixBorder(color: "FFF", width: 100),
        borderRadius: ImgixBorderRadius(
            topLeft: 25, topRight: 50, bottomLeft: 75, bottomRight: 100),
        borderRadiusInner: ImgixBorderRadius.circular(200),
      ),
    );

    expect(getQueryParams(url)["border"], equals("100,FFF"));
    expect(getQueryParams(url)["border-radius"], equals("25,50,100,75"));
    expect(getQueryParams(url)["border-radius-inner"], equals("200"));
  });

  test('Sets padding and backgroundColor', () {
    final url = getImgixUrl(
      baseUrl,
      ImgixOptions(padding: 100, backgroundColor: "FFF"),
    );

    expect(getQueryParams(url)["pad"], equals("100"));
    expect(getQueryParams(url)["bg"], equals("FFF"));
  });

  test('Sets fillColor and fillMode', () {
    final url = getImgixUrl(
      baseUrl,
      ImgixOptions(fillMode: ImgixFillMode.blur, fillColor: "FFF"),
    );

    expect(getQueryParams(url)["fill"], equals("blur"));
    expect(getQueryParams(url)["fill-color"], equals("FFF"));
  });

  test('Sets downloadFileName', () {
    final url = getImgixUrl(
      baseUrl,
      ImgixOptions(downloadFileName: "original.png"),
    );

    expect(getQueryParams(url)["dl"], equals("original.png"));
  });

  test('Sets rotation and flip', () {
    final url = getImgixUrl(
      baseUrl,
      ImgixOptions(rotation: 60, flip: ImgixFlip.horizontalVertical),
    );

    expect(getQueryParams(url)["rot"], equals("60"));
    expect(getQueryParams(url)["flip"], equals("hv"));
  });

  test('Sets brightness', () {
    final url = getImgixUrl(
      baseUrl,
      ImgixOptions(brightness: -55.5),
    );

    expect(getQueryParams(url)["bri"], equals("-55.5"));
  });
}
