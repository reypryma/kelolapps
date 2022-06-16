import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';

import 'dart:ui';

import 'package:nb_utils/nb_utils.dart';
import '../config/kelolaku/constant.dart';
import 'package:intl/intl.dart';

const applicationMaxWidth = 500.0;

class CustomTheme extends StatelessWidget {
  final Widget? child;

  CustomTheme({required this.child});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: child!,
    );
  }
}

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

Widget text(
    String? text, {
      var fontSize = textSizeLargeMedium,
      Color? textColor,
      var fontFamily,
      var isCentered = false,
      var maxLine = 1,
      var latterSpacing = 0.5,
      bool textAllCaps = false,
      var isLongText = false,
      bool lineThrough = false,
    }) {
  return Text(
    textAllCaps ? text!.toUpperCase() : text!,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    maxLines: isLongText ? null : maxLine,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontFamily: fontFamily ?? null,
      fontSize: fontSize,
      color: textColor ?? Colors.black54,
      height: 1.5,
      letterSpacing: latterSpacing,
      decoration: lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
    ),
  );
}

BoxDecoration boxDecoration({double radius = 2, Color color = Colors.transparent, Color? bgColor, var showShadow = false}) {
  return BoxDecoration(
    color: bgColor ?? Colors.white,
    boxShadow: showShadow ? defaultBoxShadow(shadowColor: shadowColorGlobal) : [BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

void changeStatusColor(Color color) async {
  setStatusBarColor(color);
}

Widget commonCacheImageWidget(String? url, double height, {double? width, BoxFit? fit}) {
  if (url.validate().startsWith('http')) {
    if (isMobile) {
      return CachedNetworkImage(
        placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
        imageUrl: '$url',
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        errorWidget: (_, __, ___) {
          return SizedBox(height: height, width: width);
        },
      );
    } else {
      return Image.network(url!, height: height, width: width, fit: fit ?? BoxFit.cover);
    }
  } else {
    return Image.asset(url!, height: height, width: width, fit: fit ?? BoxFit.cover);
  }
}

Widget settingItem(context, String text, {Function? onTap, Widget? detail, Widget? leading, Color? textColor, int? textSize, double? padding}) {
  return InkWell(
    onTap: onTap as void Function()?,
    child: Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: padding ?? 8, bottom: padding ?? 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(child: leading ?? SizedBox(), width: 30, alignment: Alignment.center),
              leading != null ? 10.width : SizedBox(),
              Text(text, style: primaryTextStyle(size: textSize ?? 18, color: textColor ?? Colors.orange)).expand(),
            ],
          ).expand(),
          detail ?? Icon(Icons.arrow_forward_ios, size: 16, color: Colors.orange),
        ],
      ).paddingOnly(left: 16, right: 16, top: 8, bottom: 8),
    ),
  );
}

Widget appBarTitleWidget(context, String title, {Color? color, Color? textColor}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 60,
    color: color ?? Colors.white,
    child: Row(
      children: <Widget>[
        Text(
          title,
          style: boldTextStyle(color: color ?? KelolakuGlobalColor.colorPrimaryExtra, size: 20),
          maxLines: 1,
        ).expand(),
      ],
    ),
  );
}

AppBar appBar(BuildContext context, String title, {List<Widget>? actions, bool showBack = true, Color? color, Color? iconColor, Color? textColor}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: color ?? KelolakuGlobalColor.colorPrimaryExtra,
    leading: showBack
        ? IconButton(
      onPressed: () {
        finish(context);
      },
      icon: Icon(Icons.arrow_back, color: white),
    )
        : null,
    title: appBarTitleWidget(context, title, textColor: textColor, color: color),
    actions: actions,
    elevation: 0.5,
  );
}

Widget? Function(BuildContext, String) placeholderWidgetFn() => (_, s) => placeholderWidget();

Widget placeholderWidget() => Image.asset('images/app/placeholder.jpg', fit: BoxFit.cover);

String parseHtmlString(String? htmlString) {
  return parse(parse(htmlString).body!.text).documentElement!.text;
}

class ContainerX extends StatelessWidget {
  final Widget? mobile;
  final Widget? web;
  final bool? useFullWidth;

  ContainerX({this.mobile, this.web, this.useFullWidth});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        if (constraints.device == DeviceSize.mobile) {
          return mobile ?? SizedBox();
        } else {
          return Container(
            alignment: Alignment.topCenter,
            child: Container(
              constraints: useFullWidth.validate() ? null : dynamicBoxConstraints(maxWidth: context.width() * 0.9),
              child: web ?? SizedBox(),
            ),
          );
        }
      },
    );
  }
}

BoxConstraints dynamicBoxConstraints({double? maxWidth}) {
  return BoxConstraints(maxWidth: maxWidth ?? applicationMaxWidth);
}
