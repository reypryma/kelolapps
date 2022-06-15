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

const TextStyle ff = TextStyle(
    fontSize: 16,
    fontFamily: 'Bariol',
    fontWeight: FontWeight.w100,
    fontStyle: FontStyle.italic);

TextStyle large48 = primaryTextStyle(
  size: 48,
  fontFamily: 'Inter',
  weight: FontWeight.w700,
);

TextStyle large36 = primaryTextStyle(
  size: 36,
  fontFamily: 'Inter',
  weight: FontWeight.w700,
);

const TextStyle large28 = TextStyle(
  fontSize: 28,
  fontFamily: 'Inter',
  fontWeight: FontWeight.w700,
);

TextStyle heading1 = primaryTextStyle(
  size: 24,
  fontFamily: 'Inter',
  weight: FontWeight.w700,
);

TextStyle heading2 = primaryTextStyle(
  size: 20,
  fontFamily: 'Inter',
  weight: FontWeight.w700,
);

TextStyle heading3 = primaryTextStyle(
  size: 16,
  fontFamily: 'Inter',
  weight: FontWeight.w700,
);

const TextStyle heading4 = TextStyle(
  fontSize: 14,
  fontFamily: 'Inter',
  fontWeight: FontWeight.w700,
);

const TextStyle heading5 = TextStyle(
  fontSize: 12,
  fontFamily: 'Inter',
  fontWeight: FontWeight.w700,
);

// Title
//   const TextStyle title20 = TextStyle(
//     fontSize: 20,
//     fontFamily: 'Inter',
//     fontWeight: FontWeight.w600,
//   );

TextStyle title20 = primaryTextStyle(
  size: 20,
  fontFamily: 'Inter',
  weight: FontWeight.w600,
);

TextStyle title16 = primaryTextStyle(
  size: 16,
  fontFamily: 'Inter',
  weight: FontWeight.w600,
);

TextStyle title14 = primaryTextStyle(
  size: 14,
  fontFamily: 'Inter',
  weight: FontWeight.w600,
);

TextStyle title12 = primaryTextStyle(
  size: 12,
  fontFamily: 'Inter',
  weight: FontWeight.w600,
);

const TextStyle title10 = TextStyle(
  fontSize: 10,
  fontFamily: 'Inter',
  fontWeight: FontWeight.w600,
);

const TextStyle title9 = TextStyle(
  fontSize: 9,
  fontFamily: 'Inter',
  fontWeight: FontWeight.w600,
);

// Long Description Text
const TextStyle textRegular48 = TextStyle(
  fontSize: 48,
  fontFamily: 'Manrope',
  fontWeight: FontWeight.w400,
);

const TextStyle textRegular36 = TextStyle(
  fontSize: 36,
  fontFamily: 'Manrope',
);

const TextStyle textRegular28 = TextStyle(
  fontSize: 28,
  fontFamily: 'Manrope',
);

const TextStyle textRegular24 = TextStyle(
  fontSize: 24,
  fontFamily: 'Manrope',
);

TextStyle textRegular20 = TextStyle(
  fontSize: 20,
  fontFamily: 'Manrope',
);

const TextStyle textRegular16 = TextStyle(
  fontSize: 16,
  fontFamily: 'Manrope',
);

const TextStyle textRegular14 = TextStyle(
  fontSize: 14,
  fontFamily: 'Manrope',
);

const TextStyle textRegular12 = TextStyle(
  fontSize: 12,
  fontFamily: 'Manrope',
);

const TextStyle textRegular10 = TextStyle(
  fontSize: 10,
  fontFamily: 'Manrope',
);

const TextStyle textRegular9 = TextStyle(
  fontSize: 9,
  fontFamily: 'Manrope',
);

// Long Text with more bold
const TextStyle textSemibold20 = TextStyle(
  fontSize: 20,
  fontFamily: 'Manrope',
  fontWeight: FontWeight.w600,
);

TextStyle textSemibold16 = secondaryTextStyle(
  size: 16,
  fontFamily: 'Manrope',
  weight: FontWeight.w600,
);

const TextStyle textSemibold14 = TextStyle(
  fontSize: 14,
  fontFamily: 'Manrope',
  fontWeight: FontWeight.w600,
);

const TextStyle textSemibold12 = TextStyle(
  fontSize: 12,
  fontFamily: 'Manrope',
  fontWeight: FontWeight.w600,
);

const TextStyle textSemibold10 = TextStyle(
  fontSize: 10,
  fontFamily: 'Manrope',
  fontWeight: FontWeight.w600,
);

const TextStyle textSemibold9 = TextStyle(
  fontSize: 9,
  fontFamily: 'Manrope',
  fontWeight: FontWeight.w600,
);
