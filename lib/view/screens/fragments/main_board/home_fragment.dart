import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kelolapps/config/image.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';
import 'package:kelolapps/utils/AppWidget.dart';
import 'package:kelolapps/utils/dimensions.dart';
import 'package:nb_utils/nb_utils.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: KelolakuGlobalColor.colorPrimaryLogo,
          systemNavigationBarIconBrightness: Brightness.dark),
    );
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 230.0,
                floating: true,
                backgroundColor: KelolakuGlobalColor.colorPrimaryLogo,
                forceElevated: innerBoxIsScrolled,
                pinned: true,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                automaticallyImplyLeading: false,
                elevation: 0.5,
                actions: [
                  // IconButton(
                  //   icon: Icon(Icons.settings, color: tomato),
                  //   onPressed: () {
                  //
                  //   },
                  // )
                ],
                title: innerBoxIsScrolled
                    ? Text(
                        "Dashboard Kelolaku",
                        style: heading1,
                      )
                    : null,
                bottom: !innerBoxIsScrolled
                    ? PreferredSize(
                        preferredSize: Size(150, 150),
                        child: Container(
                          height: 100,
                          margin: EdgeInsets.only(left: 16, top: 16),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.912,
                                height: 60,
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16),
                                margin: EdgeInsets.only(
                                    right: context.width() / 28),
                                decoration: boxDecorationDefault(
                                    color:
                                    Colors.white),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        // Text(
                                        //   'https://kelolaku.com/majumakmur',
                                        //   style: textRegular14,
                                        //   maxLines: 1,
                                        //   softWrap: true,
                                        //   overflow: TextOverflow.ellipsis,
                                        // ),
                                        Container(
                                          padding: EdgeInsets.only(top: 8, bottom: 8),
                                          decoration: boxDecorationWithRoundedCorners(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('https://kelolaku.com/majumakmur', style: textRegular16.copyWith(color: KelolakuGlobalColor.dark)),
                                              Text('Bagikan', style: heading3.copyWith(color: KelolakuGlobalColor.ocean)),
                                            ],
                                          ),
                                        ).expand(),
                                      ],
                                    ).expand(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ).onTap(() {}),
                      )
                    : null,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.MARGIN_SIZE_GRID_8),
                    margin: EdgeInsets.only(top: Dimensions.VERTICAL_SIZE_16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Toko Maju Makmur",
                          style: large36.copyWith(
                              color: KelolakuGlobalColor.light70),
                        ),
                        SizedBox(height: Dimensions.VERTICAL_SIZE_8),
                        Text(
                          "Selamat, Kini Tokomu sudah digital! Klik “bagikan” untuk promosikan tokomu di whatsapp dan sosial media untuk menjangkau lebih banyak potensi pembeli.",
                          style: textSemibold16.copyWith(
                              color: KelolakuGlobalColor.light70),
                            maxLines: 3,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                        ),
                        SingleChildScrollView(
                          // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Container(
            margin: EdgeInsets.only(top: 8),
            width: context.width(),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
