import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';

import 'dart:ui';

import 'package:nb_utils/nb_utils.dart';
import '../config/kelolaku/constant.dart';
import 'package:intl/intl.dart';

import '../config/kelolaku/text_style.dart';


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
    // height: 60,
    color: color ?? Colors.white,
    child: Row(
      children: <Widget>[
        Text(
          title,
          style: heading3.copyWith(color: textColor ?? KelolakuGlobalColor.dark),
          maxLines: 1,
        ).expand(),
      ],
    ),
  );
}

AppBar appBar(BuildContext context, String title, {List<Widget>? actions, bool showBack = true, Color? color, Color? iconColor, Color? textColor, double? elevationValue}) {
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
    elevation: elevationValue ?? 0.5,
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


class TopCard extends StatelessWidget {
  final String name;
  final String acno;
  final String bal;

  TopCard({Key? key, required this.name, required this.acno, required this.bal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      height: context.height(),
      color: context.cardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(Icons.account_balance_wallet, color: KelolakuGlobalColor.colorPrimaryExtra, size: 30).paddingOnly(top: 8, left: 8),
                Text(name, style: primaryTextStyle(size: 18)).paddingOnly(left: 8, top: 8).expand(),
                Icon(Icons.info, color: KelolakuGlobalColor.grayFed, size: 20).paddingOnly(right: 8)
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Account Number", style: secondaryTextStyle(size: 16)).paddingOnly(left: 8, top: 8, bottom: 8),
              Text(acno, style: primaryTextStyle(color: KelolakuGlobalColor.yellow)).paddingOnly(right: 8, top: 8, bottom: 8),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Balance", style: secondaryTextStyle(size: 16)).paddingOnly(left: 8, top: 8, bottom: 8),
              Text(bal, style: primaryTextStyle(color: KelolakuGlobalColor.orange)).paddingOnly(right: 8, top: 8, bottom: 8),
            ],
          )
        ],
      ),
    );
  }
}

Widget ring(String description) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(150.0),
          border: Border.all(width: 16.0, color: KelolakuGlobalColor.lightSmoke),
        ),
      ),
      SizedBox(height: 16),
      Text(description, style: boldTextStyle(color: KelolakuGlobalColor.light70, size: 20), maxLines: 2, textAlign: TextAlign.center)
    ],
  );
}

Widget shareIcon(String iconPath, Color tintColor) {
  return Padding(
    padding: EdgeInsets.only(left: 20, right: 20),
    child: Image.asset(iconPath, width: 28, height: 28, fit: BoxFit.fill),
  );
}

List<IconData> _iconList = [
  Icons.star_rate,
  Icons.code,
  Icons.adb,
  Icons.android,
  Icons.select_all,
  Icons.eco,
  Icons.label_important,
  Icons.album,
  Icons.scatter_plot,
  Icons.memory,
  Icons.audiotrack,
  Icons.miscellaneous_services,
  Icons.whatshot
];

Random _random = Random();

// create random color for polylines
Color _getColor() {
  return Color.fromARGB(
      255, _random.nextInt(255), _random.nextInt(255), _random.nextInt(255));
}

Widget screenDetailList({required BuildContext context, required String title, required StatefulWidget page}){
  Color _color = _getColor();
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    },
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Card(
        elevation: 0.5,
        child: Container(
          margin: EdgeInsets.all(18),
          child: Row(
            children: [
              Icon(_iconList[_random.nextInt(_iconList.length)], color: _color, size: 26),
              SizedBox(width: 24),
              Expanded(
                child: Text(title, style: TextStyle(
                    fontSize: 16, color: black, fontWeight: FontWeight.w500
                )),
              ),
              Icon(Icons.chevron_right, size: 30, color: _color),
            ],
          ),
        ),
      ),
    ),
  );
}

CachedNetworkImage buildCacheNetworkImage({double? width, double? height, url, plColor, imageColor}){
  if(width == 0 && height == 0){
    return CachedNetworkImage(
      placeholder: (context, url) {
        return Container(
          color: plColor==null?Colors.grey[200]:plColor,
        );
      },
      errorWidget: (context, url, error) {
        return Container(
          color: Colors.grey[200],
        );
      },
      imageUrl: url,
      fit: BoxFit.cover,
      color: imageColor==null?null:imageColor,
    );
  } else if(height == 0){
    return CachedNetworkImage(
      placeholder: (context, url) {
        return Container(
          width: width,
          color: plColor==null?Colors.grey[200]:plColor,
        );
      },
      errorWidget: (context, url, error) {
        return Container(
          width: width,
          color: Colors.grey[200],
        );
      },
      imageUrl: url,
      fit: BoxFit.cover,
      width: width,
      color: imageColor==null?null:imageColor,
    );
  } else {
    return CachedNetworkImage(
      placeholder: (context, url) {
        return SizedBox.shrink();
      },
      errorWidget: (context, url, error) {
        return SizedBox.shrink();
      },
      imageUrl: url,
      fit: BoxFit.cover,
      width: width,
      height: height,
      color: imageColor==null?null:imageColor,
    );
  }
}