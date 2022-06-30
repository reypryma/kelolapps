import 'dart:ffi';

import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/AppWidget.dart';

Widget createDefaultLabel(context, [String payStatus = "Belum Dibayar"]) {
  return Container(
    padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
    decoration: BoxDecoration(
        color: payStatus == "Belum Dibayar"
            ? KelolakuGlobalColor.orange40
            : KelolakuGlobalColor.green,
        borderRadius: BorderRadius.circular(2)),
    child: Row(
      children: [
        Text(payStatus, style: TextStyle(color: Colors.white, fontSize: 13)),
        SizedBox(
          width: 4,
        ),
        Icon(Icons.payments_outlined, color: Colors.white, size: 11)
      ],
    ),
  );
}

BoxDecoration boxDecorations(
    {double radius = 8,
    Color color = Colors.transparent,
    Color? bgColor,
    var showShadow = false}) {
  return BoxDecoration(
    color: bgColor,
    boxShadow: showShadow
        ? [
            BoxShadow(
                color: KelolakuGlobalColor.lightSmoke,
                blurRadius: 10,
                spreadRadius: 2)
          ]
        : [BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

Badge badgeLevel(
    {String? title, TextStyle? textBadgeStyle, double? badgeRadius}) {
  return Badge(
      badgeColor: KelolakuGlobalColor.green,
      borderRadius: BorderRadius.circular(20),
      padding: EdgeInsets.all(badgeRadius ?? 3),
      shape: BadgeShape.square,
      badgeContent: Text(
        title!,
        style: textBadgeStyle ??
            title12.copyWith(color: KelolakuGlobalColor.light70),
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
    return placeHolderWidget(
        height: height,
        width: width,
        fit: fit,
        alignment: alignment,
        radius: radius);
  } else if (url.validate().startsWith('http')) {
    return CachedNetworkImage(
      imageUrl: url,
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
      placeholder: (_, s) {
        if (!usePlaceholderIfUrlEmpty) return SizedBox();
        return placeHolderWidget(
            height: height,
            width: width,
            fit: fit,
            alignment: alignment,
            radius: radius);
      },
    );
  } else {
    return Image.asset(url,
            height: height,
            width: width,
            fit: fit,
            alignment: alignment ?? Alignment.center)
        .cornerRadiusWithClipRRect(radius ?? defaultRadius);
  }
}

class GlobalFunction {
  bool validateMobileNumber(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,15}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length < 8) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  bool validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  String removeDecimalZeroFormat(double v) {
    NumberFormat formatter = NumberFormat();
    formatter.minimumFractionDigits = 0;
    formatter.maximumFractionDigits = 2;
    return formatter.format(v);
  }

  String formatTime(int timeNum) {
    return timeNum < 10 ? "0" + timeNum.toString() : timeNum.toString();
  }

  Future showProgressDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () {
              return Future.value(false);
            },
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}

extension StringExtension on String? {
  String? toCurrencyFormat({var format = '\$'}) {
    return format + this;
  }

  //list[index].regular_price.toString().toCurrencyFormat()!,
  String formatDateTime() {
    if (this == null || this!.isEmpty || this == "null") {
      return "NA";
    } else {
      return DateFormat("HH:mm dd MMM yyyy", "en_US")
          .format(DateFormat("yyyy-MM-dd HH:mm:ss.0", "en_US").parse(this!));
    }
  }

  String formatRupiah({var localeChoose = 'ID'}) {
    // final formatCurrency = NumberFormat.simpleCurrency(locale: 'id_ID');
    return NumberFormat('#,##0', localeChoose).format(toDouble());
  }

  String formatDate() {
    if (this == null || this!.isEmpty || this == "null") {
      return "NA";
    } else {
      return DateFormat("dd MMM yyyy", "en_US")
          .format(DateFormat("yyyy-MM-dd", "en_US").parse(this!));
    }
  }
}

class CurrencyPtBrInputFormatter extends TextInputFormatter {
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    double value = double.parse(newValue.text);
    final formatter = new NumberFormat("#,##0.00", "pt_BR");
    String newText = "R\$ " + formatter.format(value / 100);

    return newValue.copyWith(
        text: newText,
        selection: new TextSelection.collapsed(offset: newText.length));
  }
}

// how to use
Widget _fieldValues() {
  return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 60),
      child: TextFormField(
          decoration: InputDecoration(
            icon: Icon(Icons.monetization_on),
            labelText: 'Masukkan Harga',
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            CurrencyPtBrInputFormatter()
          ]));
}

class GlobalStyle {
  // appBar
  static const Color appBarIconThemeColor = Colors.black;
  static const double appBarElevation = 0;
  static const SystemUiOverlayStyle appBarSystemOverlayStyle =
      SystemUiOverlayStyle.dark;
  static const Color appBarBackgroundColor = Colors.white;
  static const TextStyle appBarTitle =
  TextStyle(fontSize: 18, color: Colors.black);
  /*
  this is used for height at product card using gridDelegate
  if you change font size or using custom font such as google font, sometimes there is an error said
  "Bottom overflowed by xx pixel" depends on the font height (Every font has a different height)
  so you need to change below
  */
  static const double gridDelegateRatio = 0.625; // lower is more longer
  static const double gridDelegateFlashsaleRatio =
  0.597; // lower is more longer
  static const double horizontalProductHeightMultiplication =
  1.90; // higher is more longer
}

Widget createCoupon(BuildContext context, String couponRoute, {String? textFill, Color? bgColor} ){
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: (){
        Get.toNamed(couponRoute);
    },
    child: Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: bgColor ?? KelolakuGlobalColor.colorPrimaryExtra,
          borderRadius: BorderRadius.circular(5)
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Text(
                textFill ?? 'Ada Promo untuk Kamu',
                style: TextStyle(fontSize: 14, color: Color(0xffffffff), fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Icon(Icons.local_offer, color: Colors.white)
        ],
      ),
    ),
  );
}