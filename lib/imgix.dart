library imgix;

import 'package:imgix/src/adjust.dart';
import 'package:imgix/src/auto.dart';
import 'package:imgix/src/border.dart';
import 'package:imgix/src/fill.dart';
import 'package:imgix/src/format.dart';
import 'package:imgix/src/quality.dart';
import 'package:imgix/src/rotate.dart';
import 'package:imgix/src/size.dart';
import 'package:imgix/src/trim.dart';
import 'package:imgix/src/utils.dart';

export 'package:imgix/src/auto.dart' show ImgixAuto;
export 'package:imgix/src/border.dart' show ImgixBorder, ImgixBorderRadius;
export 'package:imgix/src/fill.dart' show ImgixFillMode;
export 'package:imgix/src/format.dart' show ImgixFormat;
export 'package:imgix/src/rotate.dart' show ImgixFlip;
export 'package:imgix/src/size.dart' show ImgixFit;
export 'package:imgix/src/trim.dart' show ImgixTrim;

class ImgixOptions {
  /// The output format to convert the image to.
  ///
  /// https://docs.imgix.com/apis/url/format/fm
  final ImgixFormat format;

  /// The height of the output image.
  ///
  /// Can be used as a ratio of source height if set between 0.0 and 1.0.
  ///
  /// https://docs.imgix.com/apis/url/size/h
  final double height;

  /// The width of the output image.
  ///
  /// Can be used as a ratio of source width if set between 0.0 and 1.0.
  ///
  /// https://docs.imgix.com/apis/url/size/w
  final double width;

  /// The maximum allowed height of the output image.
  ///
  /// Will only work if [fit] is set to [ImgixFit.crop].
  ///
  /// https://docs.imgix.com/apis/url/size/max-h
  final int maxHeight;

  /// The maximum allowed width of the output image.
  ///
  /// Will only work if [fit] is set to [ImgixFit.crop].
  ///
  /// https://docs.imgix.com/apis/url/size/max-w
  final int maxWidth;

  /// The minimum allowed height of the output image.
  ///
  /// Will only work if [fit] is set to [ImgixFit.crop].
  ///
  /// https://docs.imgix.com/apis/url/size/min-h
  final int minHeight;

  /// The minimum allowed width of the output image.
  ///
  /// Will only work if [fit] is set to [ImgixFit.crop].
  ///
  /// https://docs.imgix.com/apis/url/size/min-w
  final int minWidth;

  /// The fit parameter controls how the output image is fit to its
  /// target dimensions after resizing,
  /// and how any background areas will be filled.
  ///
  /// https://docs.imgix.com/apis/url/size/fit
  final ImgixFit fit;

  /// The auto parameter helps you automate a baseline level of optimization
  /// across your entire image catalog.
  ///
  /// https://docs.imgix.com/apis/url/auto
  final List<ImgixAuto> auto;

  /// Trims the image to remove a uniform border around the image.
  /// This operation must be set for the other trim parameters to work,
  /// and it will change the size of the image.
  ///
  /// https://docs.imgix.com/apis/url/trim/trim
  final ImgixTrim trim;

  /// The trim tolerance parameter defines the tolerance
  /// for the [ImgixTrim.color] operation.
  ///
  /// https://docs.imgix.com/apis/url/trim/trimtol
  final double trimTolerance;

  /// Controls the output quality of lossy file [format]
  /// ([ImgixFormat.jpg], [ImgixFormat.pjpg], [ImgixFormat.webp],
  /// or [ImgixFormat.jxr]).
  ///
  /// https://docs.imgix.com/apis/url/format/q
  final int quality;

  /// Controls the output density of your image, so you can serve images at the
  /// correct density for every user’s device from a single master image.
  ///
  /// You must specify a [width], a [height], or both for this parameter to work.
  ///
  /// The default is 1 and the maximum value is 8.
  ///
  /// https://docs.imgix.com/apis/url/dpr
  final double devicePixelRatio;

  /// Draws a border around the image, in the width and color defined.
  /// The border will overlap the image rather than altering its size.
  ///
  /// https://docs.imgix.com/apis/url/border-and-padding/border
  final ImgixBorder border;

  /// Sets the outer radius of the border.
  ///
  /// https://docs.imgix.com/apis/url/border-and-padding/border-radius
  final ImgixBorderRadius borderRadius;

  /// Sets the inner radius of the border, in pixels.
  ///
  /// https://docs.imgix.com/apis/url/border-and-padding/border-radius-inner
  final ImgixBorderRadius borderRadiusInner;

  /// Pads the image by the number of pixels specified.
  /// Must be a positive integer.
  ///
  /// https://docs.imgix.com/apis/url/border-and-padding/pad
  final int padding;

  /// Allows you to fill in any transparent areas in your image with a color of your choice.
  ///
  /// 3 (RGB, FFF), 4 (ARGB, FFFF), 6 (RGB, FFFFFF), or 8 (ARGB, FFFFFFFF) character color hex (without #)
  ///
  /// https://docs.imgix.com/apis/url/fill/bg
  final String backgroundColor;

  /// Specifies the solid color applied to the excess space of an image resized
  /// with [fit] of [ImgixFit.fill] or [ImgixFit.fillMax].
  ///
  /// The parameter is dependent on the [fillMode] of [ImgixFillMode.solid] mode.
  ///
  /// 3 (RGB, FFF), 4 (ARGB, FFFF), 6 (RGB, FFFFFF), or 8 (ARGB, FFFFFFFF) character color hex (without #)
  ///
  /// https://docs.imgix.com/apis/url/fill/fill-color
  final String fillColor;

  /// The fill parameter determines how the excess space in an image resized
  /// with [fit] of [ImgixFit.fill] or [ImgixFit.fillMax] should be filled.
  ///
  /// https://docs.imgix.com/apis/url/fill/fill
  final ImgixFillMode fillMode;

  /// When used in a link, will force the browser to download the image instead
  /// of opening it in a new window. Set the value to your desired filename.
  ///
  /// https://docs.imgix.com/apis/url/format/dl
  final String downloadFileName;

  /// Rotates the image by degrees according to the value specified.
  ///
  /// Must be between 0 and 359 (inclusive).
  ///
  /// https://docs.imgix.com/apis/url/rotation/rot
  final double rotation;

  /// Flips the image horizontally, vertically, or both.
  ///
  /// https://docs.imgix.com/apis/url/rotation/flip
  final ImgixFlip flip;

  /// Adjusts the overall brightness of the image.
  ///
  /// Must be between -100 and +100 (inclusive).
  ///
  /// https://docs.imgix.com/apis/url/adjustment/bri
  final double brightness;

  ImgixOptions({
    this.format,
    this.height,
    this.width,
    this.maxHeight,
    this.maxWidth,
    this.minHeight,
    this.minWidth,
    this.fit,
    this.auto,
    this.trim,
    this.trimTolerance,
    this.quality,
    this.devicePixelRatio,
    this.border,
    this.borderRadius,
    this.borderRadiusInner,
    this.padding,
    this.backgroundColor,
    this.fillColor,
    this.fillMode,
    this.downloadFileName,
    this.rotation,
    this.flip,
    this.brightness,
  });

  ImgixOptions copyWith({
    ImgixFormat format,
    bool noFormat = false,
    double height,
    bool noHeight = false,
    double width,
    bool noWidth = false,
    int maxHeight,
    bool noMaxHeight = false,
    int maxWidth,
    bool noMaxWidth = false,
    int minHeight,
    bool noMinHeight = false,
    int minWidth,
    bool noMinWidth = false,
    ImgixFit fit,
    bool noFit = false,
    List<ImgixAuto> auto,
    bool noAuto = false,
    ImgixTrim trim,
    bool noTrim = false,
    double trimTolerance,
    bool noTrimTolerance = false,
    int quality,
    bool noQuality = false,
    double devicePixelRatio,
    bool noDevicePixelRatio = false,
    ImgixBorder border,
    bool noBorder = false,
    ImgixBorderRadius borderRadius,
    bool noBorderRadius = false,
    ImgixBorderRadius borderRadiusInner,
    bool noBorderRadiusInner = false,
    int padding,
    bool noPadding = false,
    String backgroundColor,
    bool noBackgroundColor = false,
    String fillColor,
    bool noFillColor = false,
    ImgixFillMode fillMode,
    bool noFillMode = false,
    String downloadFileName,
    bool noDownloadFileName = false,
    double rotation,
    bool noRotation = false,
    ImgixFlip flip,
    bool noFlip = false,
    double brightness,
    bool noBrightness = false,
  }) =>
      ImgixOptions(
        format: !noFormat ? format ?? this.format : null,
        height: !noHeight ? height ?? this.height : null,
        width: !noWidth ? width ?? this.width : null,
        maxHeight: !noMaxHeight ? maxHeight ?? this.maxHeight : null,
        maxWidth: !noMaxWidth ? maxWidth ?? this.maxWidth : null,
        minHeight: !noMinHeight ? minHeight ?? this.minHeight : null,
        minWidth: !noMinWidth ? minWidth ?? this.minWidth : null,
        fit: !noFit ? fit ?? this.fit : null,
        auto: !noAuto ? auto ?? this.auto : null,
        trim: !noTrim ? trim ?? this.trim : null,
        trimTolerance:
            !noTrimTolerance ? trimTolerance ?? this.trimTolerance : null,
        quality: !noQuality ? quality ?? this.quality : null,
        devicePixelRatio: !noDevicePixelRatio
            ? devicePixelRatio ?? this.devicePixelRatio
            : null,
        border: !noBorder ? border ?? this.border : null,
        borderRadius:
            !noBorderRadius ? borderRadius ?? this.borderRadius : null,
        borderRadiusInner: !noBorderRadiusInner
            ? borderRadiusInner ?? this.borderRadiusInner
            : null,
        padding: !noPadding ? padding ?? this.padding : null,
        backgroundColor:
            !noBackgroundColor ? backgroundColor ?? this.backgroundColor : null,
        fillColor: !noFillColor ? fillColor ?? this.fillColor : null,
        fillMode: !noFillMode ? fillMode ?? this.fillMode : null,
        downloadFileName: !noDownloadFileName
            ? downloadFileName ?? this.downloadFileName
            : null,
        rotation: !noRotation ? rotation ?? this.rotation : null,
        flip: !noFlip ? flip ?? this.flip : null,
        brightness: !noBrightness ? brightness ?? this.brightness : null,
      );
}

/// Generates an Imgix URL from a [url] and [options].
///
/// [clearQueryParameters] will clear all other query parameters on the URL.
String getImgixUrl(String url, ImgixOptions options,
    {bool clearQueryParameters = false}) {
  // No options is a pass-through
  if (options == null) {
    return url;
  }

  final queryParameters = Map<String, String>();

  final appliers = <ApplyParams>[
    applyFormat,
    applyWidth,
    applyHeight,
    applyMaxWidth,
    applyMaxHeight,
    applyMinWidth,
    applyMinHeight,
    applyFit,
    applyAuto,
    applyTrim,
    applyTrimTolerance,
    applyQuality,
    applyDevicePixelRatio,
    applyBorder,
    applyBorderRadius,
    applyBorderRadiusInner,
    applyPadding,
    applyBackgroundColor,
    applyFillColor,
    applyFillMode,
    applyDownloadFileName,
    applyRotation,
    applyFlip,
    applyBrightness,
  ];

  appliers.forEach((applier) => applier(queryParameters, options));

  final uri = Uri.parse(url);

  if (!clearQueryParameters) {
    // Merge old query parameters
    uri.queryParameters.forEach((key, value) {
      if (!queryParameters.containsKey(key)) {
        queryParameters[key] = value;
      }
    });
  }

  return uri.replace(queryParameters: queryParameters).toString();
}
