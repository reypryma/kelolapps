import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:kelolapps/config/image.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';
import 'package:kelolapps/data/model/menumodel/FeatureCategory.dart';
import 'package:kelolapps/data/model/menumodel/feature_model.dart';
import 'package:kelolapps/utils/dimensions.dart';
import 'package:nb_utils/nb_utils.dart';

class OtherMenuFragment extends StatefulWidget {
  const OtherMenuFragment({Key? key}) : super(key: key);

  @override
  _OtherMenuFragmentState createState() => _OtherMenuFragmentState();
}

class _OtherMenuFragmentState extends State<OtherMenuFragment> {
  late List<FeatureCategoryModel> _categoryMenuData;

  Widget _buildMenu(){
    return GridView.count(
      padding: EdgeInsets.symmetric(horizontal: 16),
      primary: false,
      childAspectRatio: 1,
      shrinkWrap: true,
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      crossAxisCount: 3,
      children: List.generate(_categoryMenuData.length, (index) {
        return GestureDetector(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryMenuPage(title: _categoryData[index].name)));
              Get.toNamed(_categoryMenuData[index].route);
            },
            child: Column(
                children: [
                  SvgPicture.asset( _categoryMenuData[index].image, width: context.width() * 0.09333333333, height: context.width() * 0.09333333333,),
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(top: 4),
                      width: 76,
                      child: Text(
                        softWrap: true,
                        _categoryMenuData[index].name,
                        style: textSemibold12.copyWith(color: KelolakuGlobalColor.dark),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ]));
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: SvgPicture.asset(KelolaImage.bannerCategoryImage, width: width * 0.45, height: width * 0.45,),
                      ),
                      32.height,
                      _buildMenu(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    init();
  }


  Future<void> init() async {
    _categoryMenuData = getCategoryMenu();
  }
}
