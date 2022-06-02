import 'package:flutter/material.dart';
import 'package:kelolapps/config/kelolaku/global_style.dart';

/// Styles

// Bold Text Style
TextStyle boldTextStyle({
  int? size,
  Color? color,
  FontWeight? weight,
  String? fontFamily,
  double? letterSpacing,
  FontStyle? fontStyle,
  double? wordSpacing,
  TextDecoration? decoration,
  TextDecorationStyle? textDecorationStyle,
  TextBaseline? textBaseline,
  Color? decorationColor,
  Color? backgroundColor,
  double? height,
}) {
  return TextStyle(
    fontSize: size != null ? size.toDouble() : textBoldSizeGlobal,
    color: color ?? textPrimaryColorGlobal,
    fontWeight: weight ?? fontWeightBoldGlobal,
    fontFamily: fontFamily ?? fontFamilyBoldGlobal,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    decoration: decoration,
    decorationStyle: textDecorationStyle,
    decorationColor: decorationColor,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    backgroundColor: backgroundColor,
    height: height,
  );
}

// Primary Text Style
TextStyle primaryTextStyle({
  int? size,
  Color? color,
  FontWeight? weight,
  String? fontFamily,
  double? letterSpacing,
  FontStyle? fontStyle,
  double? wordSpacing,
  TextDecoration? decoration,
  TextDecorationStyle? textDecorationStyle,
  TextBaseline? textBaseline,
  Color? decorationColor,
  Color? backgroundColor,
  double? height,
}) {
  return TextStyle(
    fontSize: size != null ? size.toDouble() : textPrimarySizeGlobal,
    color: color ?? textPrimaryColorGlobal,
    fontWeight: weight ?? fontWeightPrimaryGlobal,
    fontFamily: fontFamily ?? fontFamilyPrimaryGlobal,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    decoration: decoration,
    decorationStyle: textDecorationStyle,
    decorationColor: decorationColor,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    backgroundColor: backgroundColor,
    height: height,
  );
}

// Secondary Text Style
TextStyle secondaryTextStyle({
  int? size,
  Color? color,
  FontWeight? weight,
  String? fontFamily,
  double? letterSpacing,
  FontStyle? fontStyle,
  double? wordSpacing,
  TextDecoration? decoration,
  TextDecorationStyle? textDecorationStyle,
  TextBaseline? textBaseline,
  Color? decorationColor,
  Color? backgroundColor,
  double? height,
}) {
  return TextStyle(
    fontSize: size != null ? size.toDouble() : textSecondarySizeGlobal,
    color: color ?? textSecondaryColorGlobal,
    fontWeight: weight ?? fontWeightSecondaryGlobal,
    fontFamily: fontFamily ?? fontFamilySecondaryGlobal,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    decoration: decoration,
    decorationStyle: textDecorationStyle,
    decorationColor: decorationColor,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    backgroundColor: backgroundColor,
    height: height,
  );
}

// Create Rich Text
@Deprecated('Use RichTextWidget instead')
RichText createRichText({
  required List<TextSpan> list,
  TextOverflow overflow = TextOverflow.clip,
  int? maxLines,
  TextAlign textAlign = TextAlign.left,
  TextDirection? textDirection,
  StrutStyle? strutStyle,
}) {
  return RichText(
    text: TextSpan(children: list),
    overflow: overflow,
    maxLines: maxLines,
    textAlign: textAlign,
    textDirection: textDirection,
    strutStyle: strutStyle,
  );
}

// Kelolaku Default Text Style
class KelolakuFont {
  // Bold Style
  static const TextStyle ff = TextStyle(
      fontSize: 16,
      fontFamily: 'Bariol',
      fontWeight: FontWeight.w100,
      fontStyle: FontStyle.italic);

  static const TextStyle large48 = TextStyle(
    fontSize: 48,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  );

  static const TextStyle large36 = TextStyle(
    fontSize: 36,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  );

  static const TextStyle large28 = TextStyle(
    fontSize: 28,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  );

  static const TextStyle heading1 = TextStyle(
    fontSize: 24,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 20,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 16,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  );

  static const TextStyle heading4 = TextStyle(
    fontSize: 14,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  );

  static const TextStyle heading5 = TextStyle(
    fontSize: 12,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  );

// Title
  static const TextStyle title20 = TextStyle(
    fontSize: 20,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle title16 = TextStyle(
    fontSize: 16,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle title14 = TextStyle(
    fontSize: 14,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle title12 = TextStyle(
    fontSize: 12,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle title10 = TextStyle(
    fontSize: 10,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle title9 = TextStyle(
    fontSize: 9,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );

// Long Description Text
  static const TextStyle textRegular48 = TextStyle(
    fontSize: 48,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle textRegular36 = TextStyle(
    fontSize: 36,
    fontFamily: 'Manrope',
  );

  static const TextStyle textRegular28 = TextStyle(
    fontSize: 28,
    fontFamily: 'Manrope',
  );

  static const TextStyle textRegular24 = TextStyle(
    fontSize: 24,
    fontFamily: 'Manrope',
  );

  static const TextStyle textRegular20 = TextStyle(
    fontSize: 20,
    fontFamily: 'Manrope',
  );

  static const TextStyle textRegular16 = TextStyle(
    fontSize: 16,
    fontFamily: 'Manrope',
  );

  static const TextStyle textRegular14 = TextStyle(
    fontSize: 14,
    fontFamily: 'Manrope',
  );

  static const TextStyle textRegular12 = TextStyle(
    fontSize: 12,
    fontFamily: 'Manrope',
  );

  static const TextStyle textRegular10 = TextStyle(
    fontSize: 10,
    fontFamily: 'Manrope',
  );

  static const TextStyle textRegular9 = TextStyle(
    fontSize: 9,
    fontFamily: 'Manrope',
  );

// Long Text with more bold
  static const TextStyle textSemibold20 = TextStyle(
    fontSize: 20,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle textSemibold16 = TextStyle(
    fontSize: 16,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle textSemibold14 = TextStyle(
    fontSize: 14,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle textSemibold12 = TextStyle(
    fontSize: 12,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle textSemibold10 = TextStyle(
    fontSize: 10,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle textSemibold9 = TextStyle(
    fontSize: 9,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w600,
  );
}
