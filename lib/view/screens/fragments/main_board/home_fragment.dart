import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:kelolapps/config/image.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';


class HomeFragment extends StatefulWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) { 
          return [
            SliverAppBar(
              expandedHeight: 330,
              floating: false,
              pinned: true,
              titleSpacing: 0,
              automaticallyImplyLeading: false,
              backgroundColor: innerBoxIsScrolled ? KelolakuGlobalColor.colorPrimaryExtra : context.cardColor,
              actionsIconTheme: IconThemeData(opacity: 0.0),
              title: Container(
                padding: EdgeInsets.fromLTRB(16, 42, 16, 32),
                margin: EdgeInsets.only(bottom: 8, top: 8),
                child: Row(
                  children: [
                    CircleAvatar(backgroundImage: AssetImage(KelolaImage.uploadStoreImageCircle), radius: 24),
                    10.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Hello,Laura",
                          style: primaryTextStyle(color: KelolakuGlobalColor.light70),
                        ),
                        Text(
                          "How are you today?",
                          style: primaryTextStyle(color: KelolakuGlobalColor.light70),
                        ),
                      ],
                    ).expand(),
                    Icon(Icons.notifications, size: 30, color: KelolakuGlobalColor.light70)
                  ],
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                        color: KelolakuGlobalColor.colorPrimaryLogo
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(16, 80, 16, 8),
                      padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                      decoration: boxDecorationWithRoundedCorners(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: defaultBoxShadow(),
                        backgroundColor: context.cardColor,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 130,
                            child: PageView(
                              children: [
                                TopCard(name: "Default Account", acno: "1234567899", bal: "\$12,500"),
                                TopCard(name: "Adam Johnson", acno: "9874563210", bal: "\$18,000"),
                                TopCard(name: "Ana Willson", acno: "5821479630", bal: "\$12,500"),
                              ],
                              onPageChanged: (value) {
                              },
                            ),
                          ),
                          10.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 8, bottom: 8),
                                decoration: boxDecorationWithRoundedCorners(
                                  backgroundColor: KelolakuGlobalColor.skyBlue,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.payment, color: Colors.white, size: 24),
                                    10.width,
                                    Text('Payment', style: boldTextStyle(color: Colors.white)),
                                  ],
                                ),
                              ).expand(),
                              10.width,
                              Container(
                                padding: EdgeInsets.only(top: 8, bottom: 8),
                                decoration: boxDecorationWithRoundedCorners(
                                  backgroundColor: KelolakuGlobalColor.dark,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    10.width,
                                    Text('Transfer', style: boldTextStyle(color: Colors.white)),
                                  ],
                                ),
                              ).expand(),
                            ],
                          ).paddingAll(16)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ];
        }, body: Center(

        ),
      ),
    );
  }
}
