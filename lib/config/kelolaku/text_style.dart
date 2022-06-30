import 'package:flutter/material.dart';
import 'package:kelolapps/config/kelolaku/global_style.dart';

/// Styles

// Bold Text Style
TextStyle _boldTextStyle({
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
TextStyle kprimaryTextStyle({
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
TextStyle ksecondaryTextStyle({
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

TextStyle ff = TextStyle(
    fontSize: 16,
    fontFamily: 'Bariol',
    fontWeight: FontWeight.w100,
    fontStyle: FontStyle.italic);

TextStyle large48 = kprimaryTextStyle(
  size: 48,
  fontFamily: 'Inter',
  weight: FontWeight.w700,
);

TextStyle large36 = kprimaryTextStyle(
  size: 36,
  fontFamily: 'Inter',
  weight: FontWeight.w700,
);

TextStyle large28 = TextStyle(
  fontSize: 28,
  fontFamily: 'Inter',
  fontWeight: FontWeight.w700,
);

TextStyle heading1 = kprimaryTextStyle(
  size: 24,
  fontFamily: 'Inter',
  weight: FontWeight.w700,
);

TextStyle heading2 = kprimaryTextStyle(
  size: 20,
  fontFamily: 'Inter',
  weight: FontWeight.w700,
);

TextStyle heading3 = kprimaryTextStyle(
  size: 16,
  fontFamily: 'Inter',
  weight: FontWeight.w700,
);

TextStyle heading4 = TextStyle(
  fontSize: 14,
  fontFamily: 'Inter',
  fontWeight: FontWeight.w700,
);

TextStyle heading5 = TextStyle(
  fontSize: 12,
  fontFamily: 'Inter',
  fontWeight: FontWeight.w700,
);

// Title
//   TextStyle title20 = TextStyle(
//     fontSize: 20,
//     fontFamily: 'Inter',
//     fontWeight: FontWeight.w600,
//   );

TextStyle title20 = kprimaryTextStyle(
  size: 20,
  fontFamily: 'Inter',
  weight: FontWeight.w600,
);

TextStyle title16 = kprimaryTextStyle(
  size: 16,
  fontFamily: 'Inter',
  weight: FontWeight.w600,
);

TextStyle title14 = kprimaryTextStyle(
  size: 14,
  fontFamily: 'Inter',
  weight: FontWeight.w600,
);

TextStyle title12 = kprimaryTextStyle(
  size: 12,
  fontFamily: 'Inter',
  weight: FontWeight.w600,
);

TextStyle title10 = TextStyle(
  fontSize: 10,
  fontFamily: 'Inter',
  fontWeight: FontWeight.w600,
);

TextStyle title9 = TextStyle(
  fontSize: 9,
  fontFamily: 'Inter',
  fontWeight: FontWeight.w600,
);

// Long Description Text
TextStyle textRegular48 = TextStyle(
  fontSize: 48,
  fontFamily: 'Manrope',
  fontWeight: FontWeight.w400,
);

TextStyle textRegular36 = TextStyle(
  fontSize: 36,
  fontFamily: 'Manrope',
);

TextStyle textRegular28 = TextStyle(
  fontSize: 28,
  fontFamily: 'Manrope',
);

TextStyle textRegular24 = TextStyle(
  fontSize: 24,
  fontFamily: 'Manrope',
);

TextStyle textRegular20 = TextStyle(
  fontSize: 20,
  fontFamily: 'Manrope',
);

TextStyle textRegular16 = TextStyle(
  fontSize: 16,
  fontFamily: 'Manrope',
);

TextStyle textRegular14 = TextStyle(
  fontSize: 14,
  fontFamily: 'Manrope',
);

TextStyle textRegular12 = TextStyle(
  fontSize: 12,
  fontFamily: 'Manrope',
);

TextStyle textRegular10 = TextStyle(
  fontSize: 10,
  fontFamily: 'Manrope',
);

TextStyle textRegular9 = TextStyle(
  fontSize: 9,
  fontFamily: 'Manrope',
);

// Long Text with more bold
TextStyle textSemibold20 = TextStyle(
  fontSize: 20,
  fontFamily: 'Manrope',
  fontWeight: FontWeight.w600,
);

TextStyle textSemibold16 = ksecondaryTextStyle(
  size: 16,
  fontFamily: 'Manrope',
  weight: FontWeight.w600,
);

TextStyle textSemibold14 = TextStyle(
  fontSize: 14,
  fontFamily: 'Manrope',
  fontWeight: FontWeight.w600,
);

TextStyle textSemibold12 = TextStyle(
  fontSize: 12,
  fontFamily: 'Manrope',
  fontWeight: FontWeight.w600,
);

TextStyle textSemibold10 = TextStyle(
  fontSize: 10,
  fontFamily: 'Manrope',
  fontWeight: FontWeight.w600,
);

TextStyle textSemibold9 = TextStyle(
  fontSize: 9,
  fontFamily: 'Manrope',
  fontWeight: FontWeight.w600,
);
