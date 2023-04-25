import 'package:imgix/src/utils.dart';

/// https://docs.imgix.com/apis/url/auto
enum ImgixAuto {
  compress,
  enhance,
  format,
  redeye,
}

final ApplyParams applyAuto = (queryParameters, options) {
  final auto = options.auto;
  if (auto == null) {
    return;
  }

  final autoOut = <String>[];

  if (auto.contains(ImgixAuto.compress)) {
    autoOut.add("compress");
  }
  if (auto.contains(ImgixAuto.enhance)) {
    autoOut.add("enhance");
  }
  if (auto.contains(ImgixAuto.format)) {
    autoOut.add("format");
  }
  if (auto.contains(ImgixAuto.redeye)) {
    autoOut.add("redeye");
  }

  queryParameters["auto"] = autoOut.join(",");
};
