import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:kelolapps/config/digitalstore/dshop_color_style.dart';
import 'package:kelolapps/config/image.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';
import 'package:kelolapps/helper/reusable_widget.dart';
import 'package:kelolapps/utils/app_strings.dart';
import 'package:kelolapps/utils/dimensions.dart';
import 'package:kelolapps/utils/status_bar.dart';
import 'package:nb_utils/nb_utils.dart';
import 'dart:math' as math;

class DigitalShopHomeScreen extends StatefulWidget {
  const DigitalShopHomeScreen({Key? key}) : super(key: key);

  @override
  _DigitalShopHomeState createState() => _DigitalShopHomeState();
}

class _DigitalShopHomeState extends State<DigitalShopHomeScreen> {
  late var isOpen;

  @override
  Widget build(BuildContext context) {
    var sliverheight = 0.1539408867 * context.height();

    return Scaffold(
      backgroundColor: DStoreGlobalColor.bgDigitalStore,
      body: SafeArea(
          child: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
            title: null,
            floating: true,
            expandedHeight: sliverheight,
            backgroundColor: DStoreGlobalColor.colorDigitalStore,
            automaticallyImplyLeading: false,
            bottom: PreferredSize(
              preferredSize: Size(context.width(), context.height()),
              child: Container(
                height: sliverheight,
                child: Stack(
                  children: [
                    FittedBox(
                        child: commonCachedNetworkImage(KelolaImage.bannerStore,
                            height: sliverheight,
                            width: context.width(),
                            fit: BoxFit.fill,
                            radius: 0)),
                    // .cornerRadiusWithClipRRect(16)
                    Container(
                      height: sliverheight,
                      width: context.width(),
                      padding: EdgeInsets.only(
                          left: Dimensions.MARGIN_SIZE_GRID_8,
                          right: Dimensions.MARGIN_SIZE_GRID_8,
                          top: Dimensions.VERTICAL_SIZE_16),
                      decoration: boxDecorationWithRoundedCorners(
                          borderRadius: radius(0),
                          gradient: LinearGradient(colors: [
                            KelolakuGlobalColor.dark60.withOpacity(0.4),
                            KelolakuGlobalColor.dark60.withOpacity(0.5)
                          ])),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppString.storeName,
                                style: large28.copyWith(
                                    color: KelolakuGlobalColor.light70),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 8, right: 8, top: 6, bottom: 6),
                                  decoration: boxDecorationWithRoundedCorners(
                                      backgroundColor: isOpen
                                          ? KelolakuGlobalColor.green.withOpacity(.7)
                                          : KelolakuGlobalColor.dark40,
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Text("Toko ${AppString.open}".toUpperCase(),
                                      style: textRegular14.copyWith(color: white)),
                                ),
                              ),
                              16.width,
                              AppButton(
                                color: KelolakuGlobalColor.light60,
                                padding: EdgeInsets.only( left: 8, right: 8, top: 6, bottom: 6),
                                onTap: () {
                                  //
                                },
                                elevation: 0,
                                shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(Icons.library_books_rounded, color:  KelolakuGlobalColor.dark70),
                                    4.width,
                                    Text("Informasi Toko", style: textSemibold14.copyWith(color: KelolakuGlobalColor.dark70)),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            background: Container(
              child:  Stack(
                children: [
                  FittedBox(
                      child: commonCachedNetworkImage(KelolaImage.bannerStore,
                          height: sliverheight,
                          width: context.width(),
                          fit: BoxFit.fill,
                          radius: 0)),
                  // .cornerRadiusWithClipRRect(16)
                  Container(
                    height: sliverheight,
                    width: context.width(),
                    padding: EdgeInsets.only(
                        left: Dimensions.MARGIN_SIZE_GRID_8,
                        right: Dimensions.MARGIN_SIZE_GRID_8,
                        top: Dimensions.VERTICAL_SIZE_16),
                    decoration: boxDecorationWithRoundedCorners(
                        borderRadius: radius(0),
                        gradient: LinearGradient(colors: [
                          KelolakuGlobalColor.dark60.withOpacity(0.4),
                          KelolakuGlobalColor.dark60.withOpacity(0.5)
                        ])),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppString.storeName,
                              style: large28.copyWith(
                                  color: KelolakuGlobalColor.light70),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 8, right: 8, top: 6, bottom: 6),
                                decoration: boxDecorationWithRoundedCorners(
                                    backgroundColor: isOpen
                                        ? KelolakuGlobalColor.green.withOpacity(.7)
                                        : KelolakuGlobalColor.dark40,
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child: Text("Toko ${AppString.open}".toUpperCase(),
                                    style: textRegular14.copyWith(color: white)),
                              ),
                            ),
                            16.width,
                            AppButton(
                              color: KelolakuGlobalColor.light60,
                              padding: EdgeInsets.only( left: 8, right: 8, top: 6, bottom: 6),
                              onTap: () {
                                //
                              },
                              elevation: 0,
                              shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(Icons.library_books_rounded, color:  KelolakuGlobalColor.dark70),
                                  4.width,
                                  Text("Informasi Toko", style: textSemibold14.copyWith(color: KelolakuGlobalColor.dark70)),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
            ]
          )
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        decoration: boxDecorationRoundedWithShadow(
          8,
          backgroundColor: white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart_outlined,
                color: KelolakuGlobalColor.orange),
            Text(
              "Anda memiliki Keranjang ",
              style:
                  primaryTextStyle(color: KelolakuGlobalColor.dark, size: 18),
              textAlign: TextAlign.center,
            ).expand(),
            Badge(
              elevation: 0,
              padding: EdgeInsetsDirectional.only(end: 4),
              badgeColor: KelolakuGlobalColor.dark40,
              // badgeContent: Icon(Icons.error, size: 16.0, color: Colors.red),
              child: Row(
                children: [
                  Text(
                    "Buka",
                    style: heading3.copyWith(
                        color: KelolakuGlobalColor.orange),
                  ),
                  4.width,
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: KelolakuGlobalColor.orange,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    osSetStatusBarColor(
        statusBarColor: KelolakuGlobalColor.orange.withOpacity(0.7));
    isOpen = true;
    super.initState();
  }

  @override
  void dispose() {
    setStatusBarColor(Colors.transparent);
    super.dispose();
  }

  SliverPersistentHeader makeHeader(String headerText) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 60.0,
        maxHeight: 200.0,
        child: Container(color: Colors.lightBlue, child: Center(child: Text(headerText))),
      ),
    );
  }

}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });  final double minHeight;
  final double maxHeight;
  final Widget child;  @override
  double get minExtent => minHeight;  @override
  double get maxExtent => math.max(maxHeight, minHeight);  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent)
  {
    return SizedBox.expand(child: child);
  }  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}