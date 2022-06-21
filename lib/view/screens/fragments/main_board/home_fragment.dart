import 'package:flutter/material.dart';
import 'package:kelolapps/config/image.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';
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
              expandedHeight: 230.0,
              floating: false,
              backgroundColor: KelolakuGlobalColor.colorPrimaryLogo,
              forceElevated: true,
              pinned: true,
              automaticallyImplyLeading: false,
              leading: null,
              elevation: .5,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
              ),
              shadowColor: KelolakuGlobalColor.dark,
              title: innerBoxIsScrolled ? Text("Hello", style: heading1) : null,
              bottom: innerBoxIsScrolled?
              PreferredSize(
                // preferredSize: Size(context.width(), 580),
                preferredSize: Size(300, 300),
                child: Container(
                  height: 80,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  margin: EdgeInsets.only(left: 8),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        height: 60,
                        margin: EdgeInsets.only(right: 12),
                        padding: EdgeInsets.all(16),
                        child: Image.asset(KelolaImage.kelolaLetsJoin, color: Colors.white),
                        decoration: boxDecorationDefault(color: tomato),
                      ),
                      Expanded(
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: <Widget>[
                            Container(
                              width: context.width(),
                              height: 60,
                              padding: EdgeInsets.only(left: 16, right: 16),
                              margin: EdgeInsets.only(right: context.width() / 28),
                              decoration: boxDecorationDefault(color: context.scaffoldBackgroundColor),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text('Default Theme', style: heading1, maxLines: 2),
                                    ],
                                  ).expand(),
                                ],
                              ),
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              child: const Icon(Icons.keyboard_arrow_right, color: Colors.white),
                              decoration: boxDecorationDefault(color: KelolakuGlobalColor.dark, shape: BoxShape.circle),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ).onTap(() {

                }),
              )
                  : null,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Flexible Space", style: textSemibold20),
                      SizedBox(height: 16),
                      SingleChildScrollView(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[

                          ],
                        ),
                      ),
                    ],
                  ),
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
