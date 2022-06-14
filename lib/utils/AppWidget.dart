import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';

import 'dart:ui';

import 'package:nb_utils/nb_utils.dart';
import '../config/kelolaku/constant.dart';
import 'package:intl/intl.dart';

Widget cachedImage(String? url,
    {double? height,
    Color? color,
    double? width,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    bool usePlaceholderIfUrlEmpty = true,
    double? radius}) {
  if (url.validate().isEmpty) {
    return placeHolderWidget(
        height: height,
        width: width,
        fit: fit,
        alignment: alignment,
        radius: radius);
  } else if (url.validate().startsWith('http')) {
    return CachedNetworkImage(
      imageUrl: url!,
      height: height,
      width: width,
      fit: fit,
      color: color,
      alignment: alignment as Alignment? ?? Alignment.center,
      errorWidget: (_, s, d) {
        return placeHolderWidget(
            height: height,
            width: width,
            fit: fit,
            alignment: alignment,
            radius: radius);
      },
    );
  } else {
    return Image.asset(url!,
            height: height,
            width: width,
            fit: fit,
            alignment: alignment ?? Alignment.center)
        .cornerRadiusWithClipRRect(radius ?? defaultRadius);
  }
}

Widget placeHolderWidget(
    {double? height,
    double? width,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    double? radius}) {
  return Image.asset(appIcon,
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
          alignment: alignment ?? Alignment.center)
      .cornerRadiusWithClipRRect(radius ?? defaultRadius);
}

String convertDate(date) {
  try {
    return date != null
        ? DateFormat(dateFormat).format(DateTime.parse(date))
        : '';
  } catch (e) {
    print(e);
    return '';
  }
}

Widget formField(context, hint,
    {isEnabled = true,
      isDummy = false,
      controller,
      isPasswordVisible = false,
      isPassword = false,
      keyboardType = TextInputType.text,
      FormFieldValidator<String>? validator,
      onSaved,
      textInputAction = TextInputAction.next,
      FocusNode? focusNode,
      FocusNode? nextFocus,
      IconData? suffixIcon,
      IconData? prefixIcon,
      maxLine = 1,
      suffixIconSelector}) {
  return TextFormField(
    controller: controller,
    obscureText: isPassword ? isPasswordVisible : false,
    cursorColor: KelolakuGlobalColor.colorPrimaryExtra,
    maxLines: maxLine,
    keyboardType: keyboardType,
    validator: validator,
    onSaved: onSaved,
    textInputAction: textInputAction,
    focusNode: focusNode,
    onFieldSubmitted: (arg) {
      if (nextFocus != null) {
        FocusScope.of(context).requestFocus(nextFocus);
      }
    },
    decoration: InputDecoration(
      focusedBorder: UnderlineInputBorder(borderRadius: BorderRadius.circular(spacing_standard), borderSide: BorderSide(color: Colors.transparent)),
      enabledBorder: UnderlineInputBorder(borderRadius: BorderRadius.circular(spacing_standard), borderSide: BorderSide(color: Colors.transparent)),
      filled: true,
      fillColor: KelolakuGlobalColor.light60,
      hintText: hint,
      hintStyle: const TextStyle(fontSize: textSizeMedium, color: KelolakuGlobalColor.dark40),
      prefixIcon: Icon(
        prefixIcon,
        color: KelolakuGlobalColor.dark30,
        size: 20,
      ),
      suffixIcon: isPassword
          ? GestureDetector(
        onTap: suffixIconSelector,
        child: Icon(
          suffixIcon,
          color: KelolakuGlobalColor.dark30,
          size: 20,
        ),
      )
          : Icon(
        suffixIcon,
        color: KelolakuGlobalColor.dark30,
        size: 20,
      ),
    ),
    style: TextStyle(fontSize: textSizeNormal, color: isDummy ? Colors.transparent : KelolakuGlobalColor.purpleBlack, fontFamily: fontRegular),
  );
}
