import 'package:imgix/src/utils.dart';

/// https://docs.imgix.com/apis/url/auto
enum ImgixAuto {
  compress,
  enhance,
  format,
  redeye,
}

final ApplyParams applyAuto = (queryParameters, options) {
  if (options.auto == null) {
    return;
  }

  final auto = List<String>();

  if (options.auto.contains(ImgixAuto.compress)) {
    auto.add("compress");
  }
  if (options.auto.contains(ImgixAuto.enhance)) {
    auto.add("enhance");
  }
  if (options.auto.contains(ImgixAuto.format)) {
    auto.add("format");
  }
  if (options.auto.contains(ImgixAuto.redeye)) {
    auto.add("redeye");
  }

  queryParameters["auto"] = auto.join(",");
};
