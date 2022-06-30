import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:kelolapps/config/image.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';
import 'package:kelolapps/route/route_helper.dart';
import 'package:kelolapps/utils/AppWidget.dart';
import 'package:kelolapps/utils/app_strings.dart';
import 'package:kelolapps/utils/dimensions.dart';
import 'package:kelolapps/view/screens/digital_shop/DigitalShopHomeScreen2.dart';
import 'package:nb_utils/nb_utils.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  bool isNotification = false;
  late var shopOpen;
  GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {

    scaffoldKey = GlobalKey<ScaffoldState>();
    Future.delayed(const Duration(milliseconds: 1000), () {});

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
                        preferredSize: const Size(0, 110),
                        child: Container(
                          height: 100,
                          margin: const EdgeInsets.only(left: 16, top: 4),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.912,
                                height: 60,
                                padding:
                                    const EdgeInsets.only(left: 16, right: 16),
                                margin: EdgeInsets.only(
                                    right: context.width() / 28),
                                decoration:
                                    boxDecorationDefault(color: Colors.white),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
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
                                          padding: const EdgeInsets.only(
                                              top: 8, bottom: 8),
                                          decoration:
                                              boxDecorationWithRoundedCorners(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Get.to(() =>
                                                      DigitalStoreHomeScreen());
                                                },
                                                child: Text(
                                                    //Its inside PreferedSize
                                                    'https://kelolaku.com/majumakmur',
                                                    style: textRegular16.copyWith(
                                                        color:
                                                            KelolakuGlobalColor
                                                                .dark)),
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    showModalBottomSheet(
                                                        backgroundColor:
                                                            Colors.white,
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return Stack(
                                                            alignment: Alignment
                                                                .topRight,
                                                            children: <Widget>[
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            20,
                                                                        bottom:
                                                                            200),
                                                                child: SizedBox(
                                                                  width: 45,
                                                                  height: 45,
                                                                  child:
                                                                      FloatingActionButton(
                                                                    onPressed:
                                                                        () {
                                                                      finish(
                                                                          context);
                                                                    },
                                                                    backgroundColor:
                                                                        KelolakuGlobalColor
                                                                            .light70,
                                                                    child: const Icon(
                                                                        Icons
                                                                            .close,
                                                                        color: KelolakuGlobalColor
                                                                            .dark),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            15),
                                                                child:
                                                                    Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .fromLTRB(
                                                                          20,
                                                                          25,
                                                                          20,
                                                                          20),
                                                                  // color: KelolakuGlobalColor.light60,
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  height: 250,
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: <
                                                                        Widget>[
                                                                      Text(
                                                                          AppString
                                                                              .shareTo,
                                                                          style:
                                                                              heading3.copyWith(color: KelolakuGlobalColor.dark)),
                                                                      const SizedBox(
                                                                          height:
                                                                              20),
                                                                      /**/
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: <
                                                                            Widget>[
                                                                          const Icon(
                                                                              Icons.keyboard_arrow_left,
                                                                              size: 24),
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width - 90,
                                                                            height:
                                                                                50,
                                                                            child:
                                                                                SingleChildScrollView(
                                                                              scrollDirection: Axis.horizontal,
                                                                              child: Row(
                                                                                children: <Widget>[
                                                                                  shareIcon(KelolaImage.t2_whatsup, KelolakuGlobalColor.green),
                                                                                  shareIcon(KelolaImage.t2_facebook, KelolakuGlobalColor.deepBlue),
                                                                                  shareIcon(KelolaImage.t2_instagram, KelolakuGlobalColor.red),
                                                                                  shareIcon(KelolaImage.t2_linkedin, KelolakuGlobalColor.deepBlue40),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          const Icon(
                                                                              Icons.keyboard_arrow_right,
                                                                              size: 24),
                                                                        ],
                                                                      ),
                                                                      Container(
                                                                        height:
                                                                            50,
                                                                        margin:
                                                                            EdgeInsets.all(16),
                                                                        padding: EdgeInsets.symmetric(
                                                                            vertical:
                                                                                8,
                                                                            horizontal:
                                                                                16),
                                                                        decoration: BoxDecoration(
                                                                            borderRadius:
                                                                                radius(16),
                                                                            color: KelolakuGlobalColor.lightSmoke),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              'https://eee.net/',
                                                                              style: textRegular16,
                                                                              overflow: TextOverflow.ellipsis,
                                                                            ).center(),
                                                                            Icon(Icons.copy, color: Colors.black45).onTap(() {
                                                                              Clipboard.setData(ClipboardData(text: "https://eee.net/"));
                                                                              toast('Link Disalin.', bgColor: Colors.black.withOpacity(0.5));
                                                                            })
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        });
                                                  },
                                                  child: Text('Bagikan',
                                                      style: heading3.copyWith(
                                                          color:
                                                              KelolakuGlobalColor
                                                                  .ocean))),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.MARGIN_SIZE_GRID_8),
                    margin:
                        const EdgeInsets.only(top: Dimensions.VERTICAL_SIZE_16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Toko Maju Makmur",
                          style: large36.copyWith(
                              color: KelolakuGlobalColor.light70),
                        ),
                        const SizedBox(height: Dimensions.VERTICAL_SIZE_8),
                        Text(
                          "Selamat, Kini Tokomu sudah digital! Klik “bagikan” untuk promosikan tokomu di whatsapp dan sosial media untuk menjangkau lebih banyak potensi pembeli.",
                          style: textSemibold16.copyWith(
                              color: KelolakuGlobalColor.light70),
                          maxLines: 3,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Container(
            width: context.width(),
            child: Align(
              alignment: Alignment.topLeft,
              child: SingleChildScrollView(
                // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                // scrollDirection: Axis.horizontal,
                child: Container(
                  padding: const EdgeInsets.only(
                      left: Dimensions.MARGIN_SIZE_GRID_8,
                      right: Dimensions.MARGIN_SIZE_GRID_8,
                      top: Dimensions.VERTICAL_SIZE_32,
                      bottom: Dimensions.VERTICAL_SIZE_8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Menu Pilihan",
                        style: heading1.copyWith(
                            color: KelolakuGlobalColor.dark60),
                      ),
                      8.height,
                      Container(
                        // height: 250,
                            // MediaQuery.of(context).size.height * 0.14408866995,
                        width: context.width(),
                        padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                        decoration: boxDecorationWithRoundedCorners(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: defaultBoxShadow(),
                          backgroundColor: KelolakuGlobalColor.light70,
                        ),
                        child: Column(
                          children: [
                            SettingItemWidget(
                                title: shopOpen,
                                titleTextStyle: heading3.copyWith(
                                    color: isNotification
                                        ? KelolakuGlobalColor.ocean
                                        : KelolakuGlobalColor.dark40),
                                leading: Icon(
                                  LineIcons.key,
                                  color: isNotification
                                      ? KelolakuGlobalColor.ocean
                                      : KelolakuGlobalColor.dark40,
                                ),
                                trailing: Switch(
                                  value: isNotification,
                                  activeColor: KelolakuGlobalColor.ocean,
                                  activeTrackColor: KelolakuGlobalColor.ocean,
                                  onChanged: (v) {
                                    isNotification = !isNotification;
                                    if (isNotification) {
                                      shopOpen = "Toko Buka";
                                    } else {
                                      shopOpen = "Toko Libur";
                                    }
                                    setState(() {});
                                  },
                                ),
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 4, bottom: 4),
                                decoration: boxDecorationWithShadow(
                                    borderRadius: BorderRadius.circular(8),
                                    backgroundColor: context.cardColor),
                                onTap: () {
                                  isNotification = !isNotification;
                                  if (isNotification) {
                                    shopOpen = "Toko Buka";
                                  } else {
                                    shopOpen = "Toko Libur";
                                  }
                                  setState(() {});
                                }),
                            Container(
                              margin: const EdgeInsets.all(
                                  Dimensions.MARGIN_SIZE_GRID_8),
                              child: Text(
                                "Jika toko diliburkan, maka toko tidak akan menerima pembelian sampai status toko diganti",
                                maxLines: 3,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: textRegular16.copyWith(
                                    color: KelolakuGlobalColor.dark),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    setStatusBarColor(Colors.transparent);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: KelolakuGlobalColor.colorPrimaryLogo,
          systemNavigationBarIconBrightness: Brightness.dark),
    );
    shopOpen = "Toko Libur";
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) super.setState(fn);
    isNotification ? shopOpen = "Toko Buka" : "Toko Libur";
  }
}
