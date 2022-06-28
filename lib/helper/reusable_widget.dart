import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/AppWidget.dart';

Widget createDefaultLabel(context, [String payStatus = "Belum Dibayar"]){
  return Container(
    padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
    decoration: BoxDecoration(
        color: payStatus == "Belum Dibayar" ? KelolakuGlobalColor.orange40 : KelolakuGlobalColor.green,
        borderRadius: BorderRadius.circular(2)
    ),
    child: Row(
      children: [
        Text(payStatus, style: TextStyle(
            color: Colors.white, fontSize: 13
        )),
        SizedBox(
          width: 4,
        ),
        Icon(Icons.payments_outlined, color: Colors.white, size: 11)
      ],
    ),
  );
}

BoxDecoration boxDecorations({double radius = 8, Color color = Colors.transparent, Color? bgColor, var showShadow = false}) {
  return BoxDecoration(
    color: bgColor,
    boxShadow: showShadow ? [BoxShadow(color: KelolakuGlobalColor.lightSmoke, blurRadius: 10, spreadRadius: 2)] : [BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

Badge badgeLevel({String? title, TextStyle? textBadgeStyle, double? badgeRadius}){
  return Badge(
    badgeColor: KelolakuGlobalColor.green,
    borderRadius: BorderRadius.circular(20),
    padding: EdgeInsets.all(badgeRadius ?? 3),
    shape: BadgeShape.square,
    badgeContent: Text(
      title!, style: textBadgeStyle ?? title12.copyWith(color: KelolakuGlobalColor.light70),
    ));
}

// Chip(
//   label: Text(AppString.mandatory, style: title12.copyWith(color: KelolakuGlobalColor.light70)),
//   backgroundColor: KelolakuGlobalColor.green,
// ),

Widget commonCachedNetworkImage(
    String? url, {
      double? height,
      double? width,
      BoxFit? fit,
      AlignmentGeometry? alignment,
      bool usePlaceholderIfUrlEmpty = true,
      double? radius,
      Color? color,
    }) {
  if (url!.validate().isEmpty) {
    return placeHolderWidget(height: height, width: width, fit: fit, alignment: alignment, radius: radius);
  } else if (url.validate().startsWith('http')) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
      color: color,
      alignment: alignment as Alignment? ?? Alignment.center,
      errorWidget: (_, s, d) {
        return placeHolderWidget(height: height, width: width, fit: fit, alignment: alignment, radius: radius);
      },
      placeholder: (_, s) {
        if (!usePlaceholderIfUrlEmpty) return SizedBox();
        return placeHolderWidget(height: height, width: width, fit: fit, alignment: alignment, radius: radius);
      },
    );
  } else {
    return Image.asset(url, height: height, width: width, fit: fit, alignment: alignment ?? Alignment.center).cornerRadiusWithClipRRect(radius ?? defaultRadius);
  }
}