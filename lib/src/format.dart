import 'package:imgix/src/utils.dart';

/// https://docs.imgix.com/apis/url/format/fm
enum ImgixFormat {
  gif,
  jp2,
  jpg,
  json,
  jxr,
  pjpg,
  mp4,
  png,
  png8,
  png32,
  webm,
  webp,
}

final ApplyParams applyFormat = (queryParameters, options) {
  final format = options.format;
  if (format == null) {
    return;
  }

  switch (format) {
    case ImgixFormat.gif:
      queryParameters["fm"] = "gif";
      break;
    case ImgixFormat.jp2:
      queryParameters["fm"] = "jp2";
      break;
    case ImgixFormat.jpg:
      queryParameters["fm"] = "jpg";
      break;
    case ImgixFormat.json:
      queryParameters["fm"] = "json";
      break;
    case ImgixFormat.jxr:
      queryParameters["fm"] = "jxr";
      break;
    case ImgixFormat.pjpg:
      queryParameters["fm"] = "pjpg";
      break;
    case ImgixFormat.mp4:
      queryParameters["fm"] = "mp4";
      break;
    case ImgixFormat.png:
      queryParameters["fm"] = "png";
      break;
    case ImgixFormat.png8:
      queryParameters["fm"] = "png8";
      break;
    case ImgixFormat.png32:
      queryParameters["fm"] = "png32";
      break;
    case ImgixFormat.webm:
      queryParameters["fm"] = "webm";
      break;
    case ImgixFormat.webp:
      queryParameters["fm"] = "webp";
      break;
  }
};

final ApplyParams applyDownloadFileName = (queryParameters, options) {
  final downloadFileName = options.downloadFileName;
  if (downloadFileName == null) {
    return;
  }

  queryParameters["dl"] = downloadFileName;
};
